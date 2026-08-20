from transformers import AutoImageProcessor, AutoModelForImageClassification

MODEL_NAME = "A2H0H0R1/resnet-50-plant-disease"


print("Loading AI model... Please wait.")


processor = AutoImageProcessor.from_pretrained(
    MODEL_NAME,
    use_fast=False
)


model = AutoModelForImageClassification.from_pretrained(
    MODEL_NAME
)


model.eval()


print("AI model loaded successfully!")

print("\nModel Labels:\n")

for key, value in model.config.id2label.items():
    print(key, ":", value)