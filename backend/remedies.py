REMEDIES = {

    "Potato Late blight":
        "Remove infected leaves. Apply Mancozeb or Metalaxyl fungicide. Avoid overhead irrigation.",

    "Potato Early blight":
        "Remove affected leaves. Spray Chlorothalonil or Mancozeb. Rotate crops.",

    "Potato healthy":
        "Healthy plant. No treatment required.",

    "Tomato Late blight":
        "Apply Copper fungicide. Remove infected leaves. Avoid excessive watering.",

    "Tomato Early blight":
        "Use Chlorothalonil fungicide. Improve air circulation. Remove infected leaves.",

    "Tomato healthy":
        "Healthy plant. Keep regular monitoring.",

    "Tomato Tomato mosaic virus":
        "Remove infected plants. Control aphids and insects. Use disease-free seeds. Avoid touching healthy plants after infected plants.",

    "Tomato Leaf Mold":
        "Remove infected leaves. Improve air circulation. Apply recommended fungicide if needed.",

    "Tomato Septoria leaf spot":
        "Remove infected leaves. Avoid overhead watering. Apply suitable fungicide.",

    "Tomato Spider mites Two-spotted spider mite":
        "Use insecticidal soap or neem oil. Keep plants monitored and remove severely affected leaves.",

    "Tomato Bacterial spot":
        "Remove infected leaves. Avoid wet foliage and apply recommended treatment.",

    "Tomato Target Spot":
        "Remove infected leaves. Apply suitable fungicide and improve airflow.",

    "Tomato Tomato Yellow Leaf Curl Virus":
        "Control whiteflies. Remove severely infected plants and use resistant varieties.",

    "Apple Apple scab":
        "Use Captan fungicide. Remove fallen leaves and infected fruits.",

    "Apple Black rot":
        "Prune infected branches. Apply suitable fungicide.",

    "Apple Cedar apple rust":
        "Remove infected leaves. Apply recommended fungicide and maintain proper orchard hygiene.",

    "Apple healthy":
        "Healthy plant. Continue proper care.",

    "Corn (maize) Common rust":
        "Use resistant varieties. Apply fungicide if infection increases.",

    "Corn (maize) Cercospora leaf spot Gray leaf spot":
        "Use resistant varieties. Apply recommended fungicide and avoid excessive moisture.",

    "Corn (maize) Northern Leaf Blight":
        "Remove infected leaves. Use resistant varieties and apply suitable fungicide.",

    "Corn (maize) healthy":
        "Healthy crop. Continue monitoring.",

    "Grape Black rot":
        "Remove infected fruits. Spray fungicide regularly.",

    "Grape Esca (Black Measles)":
        "Remove infected vines. Prune affected areas and maintain vineyard hygiene.",

    "Grape Leaf blight (Isariopsis Leaf Spot)":
        "Remove infected leaves. Apply suitable fungicide and improve airflow.",

    "Grape healthy":
        "Healthy grape plant. No treatment required.",

    "Orange Haunglongbing (Citrus greening)":
        "Remove infected plants if necessary. Control insect vectors and use disease-free plants.",

    "Peach Bacterial spot":
        "Remove infected leaves and fruits. Apply recommended bacterial disease control methods.",

    "Peach healthy":
        "Healthy plant. Continue proper care.",

    "Pepper, bell Bacterial spot":
        "Remove infected leaves. Avoid overhead irrigation and apply suitable treatment.",

    "Pepper, bell healthy":
        "Healthy plant. Continue monitoring.",

    "Squash Powdery mildew":
        "Improve air circulation. Remove infected leaves and apply fungicide if required.",

    "Raspberry healthy":
        "Healthy raspberry plant. No treatment required.",

    "Soybean healthy":
        "Healthy soybean plant. Continue normal irrigation.",

    "Strawberry Leaf scorch":
        "Remove affected leaves. Maintain proper watering and apply suitable fungicide.",

    "Strawberry healthy":
        "Healthy strawberry plant. No treatment required.",

    "Blueberry healthy":
        "Healthy blueberry plant. No treatment required.",

    "Cherry (including sour) Powdery mildew":
        "Remove infected parts. Improve air circulation. Apply suitable fungicide.",

    "Cherry (including sour) healthy":
        "Healthy cherry plant. No treatment required.",

}


def get_remedy(disease):

    clean_disease = (
        disease
        .replace("___", " ")
        .replace("_", " ")
        .strip()
    )

    # exact match
    if clean_disease in REMEDIES:
        return REMEDIES[clean_disease]

    # case insensitive search
    for key, value in REMEDIES.items():
        if key.lower() == clean_disease.lower():
            return value

    return "No specific remedy available. Please consult an agriculture expert."