from fastapi import FastAPI, File, UploadFile
from PIL import Image
import io
import torch

from remedies import get_remedy

try:
    from model_loader import processor, model
except Exception as e:
    print("Model Loading Error:", e)
    processor = None
    model = None


app = FastAPI(title="AI Crop Disease Detector API")


@app.get("/")
def home():
    return {
        "message": "AI Crop Disease Detector Backend Running"
    }



@app.post("/predict")
async def predict(file: UploadFile = File(...)):

    try:

        if model is None:
            return {
                "name": "Model Error",
                "confidence": 0.0,
                "remedy": "AI model is not loaded"
            }


        print("\n==============================")
        print("FILE NAME:", file.filename)
        print("CONTENT TYPE:", file.content_type)


        image_bytes = await file.read()

        print("IMAGE BYTES:", len(image_bytes))


        try:
            image = Image.open(
                io.BytesIO(image_bytes)
            ).convert("RGB")


        except Exception as img_error:

            print("IMAGE OPEN ERROR:", img_error)

            return {
                "name": "Invalid Image",
                "confidence": 0.0,
                "remedy": "Uploaded file is not a valid image"
            }



        print("==============================")
        print("IMAGE RECEIVED SUCCESSFULLY")
        print("SIZE:", image.size)
        print("==============================")


        inputs = processor(
            images=image,
            return_tensors="pt"
        )


        with torch.no_grad():

            outputs = model(**inputs)



        probabilities = torch.nn.functional.softmax(
            outputs.logits,
            dim=1
        )


        # Top 5 predictions
        top5 = torch.topk(
            probabilities,
            5
        )


        top_predictions = []


        print("\nTOP 5 PREDICTIONS:")


        for score, index in zip(
            top5.values[0],
            top5.indices[0]
        ):

            label = model.config.id2label[index.item()]

            confidence_score = round(
                score.item(),
                4
            )


            print(
                label,
                ":",
                confidence_score
            )


            top_predictions.append({

                "name": label,

                "confidence": confidence_score

            })



        confidence, predicted_class = torch.max(
            probabilities,
            dim=1
        )


        disease_name = model.config.id2label[
            predicted_class.item()
        ]



        confidence_value = round(
            confidence.item(),
            4
        )


        # Confidence message

        if confidence_value >= 0.70:

            confidence_status = "High confidence prediction"

        elif confidence_value >= 0.40:

            confidence_status = "Medium confidence prediction"

        else:

            confidence_status = "Low confidence. Please upload a clearer leaf image."



        print("==============================")
        print("FINAL PREDICTION:", disease_name)
        print("CONFIDENCE:", confidence_value)
        print("==============================")


        remedy = get_remedy(
            disease_name
        )



        return {

            "name": disease_name,

            "confidence": confidence_value,

            "confidence_status": confidence_status,

            "top_predictions": top_predictions,

            "remedy": remedy

        }



    except Exception as e:

        import traceback
        traceback.print_exc()


        return {

            "name": "Error",

            "confidence": 0.0,

            "confidence_status": "Error",

            "top_predictions": [],

            "remedy": str(e)

        }