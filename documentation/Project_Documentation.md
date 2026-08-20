Documentation — Part 1
Project Title:
AI Crop Disease Detector & Local Agricultural Advisory System
Introduction:
AI Crop Disease Detector is a Flutter-based mobile application designed to help farmers identify crop diseases using Artificial Intelligence. The user can capture or select an image of a plant leaf, and the application sends the image to an AI model for disease prediction. The application displays the predicted disease, confidence score, recommended remedies, and relevant weather information.
The system also provides additional features such as scan history, notes and calendar, farm/plot location tagging, current GPS location, user feedback, and a Talk to Expert section.
Problem Statement:
Crop diseases can significantly reduce agricultural production when they are not identified at an early stage. Farmers may not always have immediate access to agricultural experts or accurate disease identification resources. This project aims to provide a simple AI-based solution that can assist users in identifying crop diseases quickly from plant images and provide useful agricultural guidance.
Objectives:
1.	Develop an easy-to-use mobile application for crop disease detection. 
2.	Use an AI-based image classification model to identify plant diseases. 
3.	Display disease prediction with a confidence score. 
4.	Provide recommended remedies and agricultural guidance. 
5.	Integrate weather information to support farming decisions. 
6.	Maintain a history of previous crop scans. 
7.	Allow users to save crop notes and dates. 
8.	Allow users to tag farms/plots with location information. 
9.	Support current GPS location detection. 
10.	Provide a Talk to Expert feature. 
11.	Collect feedback from users for future improvement. 
🛠️ Technologies Used
Component	Technology
Frontend	Flutter / Dart
Backend	FastAPI / Python
AI Model	ResNet-50
AI Model Platform	Hugging Face
Database/Local Storage	SharedPreferences
Weather	Weather API
Location	Geolocator
PDF Reports	PDF / Printing packages
Development	VS Code
Platforms	Windows + Android
AI Crop Disease Detection
User camera ya gallery se plant/leaf image select karta hai. Image backend ko send hoti hai aur AI model disease predict karta hai. Result screen par disease name, confidence score aur recommended remedy display hoti hai.
2. Camera & Gallery
User:
•	📷 Camera se fresh image capture kar sakta hai. 
•	🖼️ Gallery se existing image select kar sakta hai. 
3. Disease Result
Result screen par:
•	Disease/plant name 
•	Confidence percentage 
•	Top predictions 
•	Disease information 
•	Symptoms 
•	Cause 
•	Prevention 
•	Recommended remedy 
display hota hai.
4. Weather Integration
Application weather information retrieve karti hai aur crop-related information ke saath display karti hai.
5. Scan History
Har successful scan ka record locally save hota hai. User previous scans dekh sakta hai aur statistics dashboard par total, healthy aur diseased scans ka count dekh sakta hai.
6. Notes & Calendar
User crop-related notes save kar sakta hai aur note ke saath date select kar sakta hai. Saved notes baad mein view/delete kiye ja sakte hain.
7. Farm / Plot Location
User farm/plot ka:
•	Farm name 
•	Crop name 
•	Location 
•	Optional note 
save kar sakta hai.
Current GPS location ka option bhi available hai, jo device ki latitude aur longitude detect karta hai.
8. Talk to Expert
User agricultural assistance ke liye Talk to Expert section access kar sakta hai.
9. User Feedback
Users app ke experience ko rating de sakte hain aur suggestions submit kar sakte hain. Feedback locally save hota hai.
10. Settings
Settings mein application ke available preferences, including language, theme aur notifications, manage kiye ja sakte hain.
________________________________________
🔄 System Workflow
User → Image Selection/Capture → Flutter App → FastAPI Backend → AI Model → Disease Prediction → Remedy + Weather → Result Screen → History
🤖 AI Model
The application uses an AI-based ResNet-50 image classification model for plant disease detection. The model is loaded through the Hugging Face ecosystem and is used by the backend to classify uploaded plant/leaf images.
The model supports multiple crop and disease classes, allowing the application to identify different plant conditions.
🧠 Prediction Process
1.	User selects or captures a leaf image. 
2.	Flutter sends the image to the backend. 
3.	FastAPI receives the uploaded image. 
4.	The image is processed using the model's image processor. 
5.	The ResNet-50 model performs classification. 
6.	The model generates prediction probabilities. 
7.	The backend calculates the confidence score. 
8.	Top predictions are identified. 
9.	The backend matches the predicted disease with the corresponding remedy. 
10.	The result is returned to the Flutter application. 
11.	Flutter displays the result to the user. 
🖥️ Backend
The backend is developed using Python and FastAPI.
Main backend components:
backend/
│
├── app.py
├── model_loader.py
├── remedies.py
└── model/
app.py
Handles the API and image prediction request.
model_loader.py
Loads the AI model and image processor.
remedies.py
Contains disease-specific remedy and agricultural guidance information.
🔌 API Workflow
Flutter App
     ↓
Image Upload
     ↓
FastAPI /predict
     ↓
Image Processing
     ↓
ResNet-50 Model
     ↓
Prediction + Confidence
     ↓
Remedy Mapping
     ↓
JSON Response
     ↓
Flutter Result Screen
📦 Example API Response
The backend returns information such as:
{
  "name": "Potato___Late_blight",
  "confidence": 0.95,
  "remedy": "Recommended treatment information",
  "top_predictions": []
}
🧪 Testing & Validation
The application should be tested using a variety of real plant/leaf images from different crops and disease categories.
For final validation, approximately 20–30 images will be tested.
For each image, we will check:
•	Image selection/camera works correctly 
•	Disease prediction is generated 
•	Confidence score is displayed 
•	Remedy is displayed 
•	Weather information loads 
•	Scan is saved in History 
•	Result screen works correctly 
•	PDF report can be generated 
•	Share functionality works 
•	Healthy/diseased classification behaves correctly 
•	Invalid or unclear images are handled appropriately 
👥 User Feedback Testing
The application will be tested by approximately 4–6 users.
Users will provide feedback about:
•	Ease of using the application 
•	Understanding of disease results 
•	Usefulness of remedies 
•	Usefulness of scanning 
•	Most useful feature 
•	Problems or suggestions 
The feedback feature in the application can store submitted feedback locally.
⚠️ Limitations
1.	Disease prediction depends on the quality and type of input image. 
2.	Poor lighting or unclear images may reduce prediction reliability. 
3.	AI predictions should not be considered a replacement for professional agricultural advice. 
4.	Weather information requires an internet connection. 
5.	The current system provides image-based disease classification rather than complete field-level diagnosis. 
6.	GPS functionality depends on device location services and permissions. 
7.	The current remedy database may not cover every possible crop disease or local farming condition. 
🚀 Future Enhancements
Possible future improvements include:
1.	Offline AI prediction for areas with limited internet access. 
2.	More crops and disease classes. 
3.	Urdu/local-language agricultural guidance. 
4.	Interactive farm maps. 
5.	Cloud synchronization of user data. 
6.	Real-time expert consultation. 
7.	Market price integration. 
8.	Crop-specific disease alerts. 
9.	Advanced weather-based farming recommendations. 
10.	Improved AI model accuracy using a larger local dataset. 
11.	Government/agricultural department integration. 
12.	Farmer community and knowledge-sharing features. 
✅ Conclusion
The AI Crop Disease Detector provides a practical AI-based approach for assisting farmers with early crop disease identification. By combining image classification, disease information, remedies, weather information, scan history, farm location, notes, and expert assistance, the application provides multiple useful tools within a single platform.
The system demonstrates how Artificial Intelligence, mobile application development, and agricultural technology can be combined to support more accessible and informed crop management.

# Documentation — Part 2

## 11. System Architecture

The AI Crop Disease Detector follows a client-server architecture consisting of a Flutter frontend, Fast API backend, AI model, local storage, weather service, and device location services.

### Architecture Flow

```text
                    ┌─────────────────────┐
                    │       User          │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │   Flutter Mobile    │
                    │      Application    │
                    └──────────┬──────────┘
                               │
                    Image Upload / Request
                               │
                               ▼
                    ┌─────────────────────┐
                    │   FastAPI Backend   │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │   ResNet-50 Model   │
                    │  Plant Classification│
                    └──────────┬──────────┘
                               │
                    Prediction + Confidence
                               │
                               ▼
                    ┌─────────────────────┐
                    │ Remedy Information  │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │   Flutter Result    │
                    │       Screen        │
                    └─────────────────────┘
```

The application also communicates with the Weather API for weather information and uses Geolocator for GPS-based location detection. SharedPreferences is used for storing local application data.

---

## 12. Project Folder Structure

The main project is divided into Flutter frontend and FastAPI backend components.

### Flutter Project Structure

```text
lib/
│
├── main.dart
│
├── data/
│   └── disease_info.dart
│
├── l10n/
│   ├── app_en.arb
│   ├── app_ur.arb
│   ├── app_localizations.dart
│   ├── app_localizations_en.dart
│   └── app_localizations_ur.dart
│
├── models/
│   ├── disease_model.dart
│   └── weather_model.dart
│
├── providers/
│   ├── locale_provider.dart
│   └── theme_provider.dart
│
├── screens/
│   ├── about_screen.dart
│   ├── expert_screen.dart
│   ├── farm_location_screen.dart
│   ├── feedback_screen.dart
│   ├── forgot_password_screen.dart
│   ├── history_screen.dart
│   ├── home_screen.dart
│   ├── login_screen.dart
│   ├── notes_screen.dart
│   ├── result_screen.dart
│   ├── scan_screen.dart
│   ├── settings_screen.dart
│   ├── signup_screen.dart
│   └── splash_screen.dart
│
├── services/
│   ├── api_service.dart
│   ├── history_service.dart
│   ├── image_service.dart
│   ├── pdf_service.dart
│   └── weather_service.dart
│
└── widgets/
    └── statistics_chart.dart
```

### Backend Structure

```text
backend/
│
├── app.py
├── model_loader.py
├── remedies.py
├── requirements.txt
│
└── model/
```

---

## 13. Frontend Modules

### 13.1 Splash Screen

The splash screen is displayed when the application starts. It provides the application branding before navigating to the main application.

### 13.2 Login and Signup

The application provides login and signup screens for the user interface and account-related flow.

### 13.3 Home Screen

The Home Screen provides access to the major application features.

It includes access to:

* Crop scanning
* Scan history
* Farm/plot locations
* Notes and calendar
* Talk to Expert
* Settings
* About section

The Home Screen also displays scan statistics such as total scans, healthy plants, and diseased plants.

### 13.4 Scan Screen

The Scan Screen allows the user to:

* Capture an image using the camera.
* Select an image from the gallery.
* Send the selected image for AI analysis.
* View the analysis process.

### 13.5 Result Screen

The Result Screen displays the output generated by the AI model.

It includes:

* Crop/plant name
* Disease name
* Confidence score
* Top predictions
* Disease details
* Cause
* Symptoms
* Prevention
* Recommended remedy
* Weather information
* PDF report generation
* Sharing options

### 13.6 History Screen

The History Screen stores previous crop scans locally.

Users can:

* View previous scans.
* Search scan records.
* Filter healthy plants.
* Filter diseased plants.
* Delete individual records.
* Clear scan history.

### 13.7 Notes and Calendar

The Notes section allows users to create crop-related notes and associate them with specific dates.

Users can:

* Add notes.
* Select a date.
* View notes for a selected date.
* Delete saved notes.

### 13.8 Farm and Plot Location

The Farm/Plot Location section allows users to save farm information.

Each record can contain:

* Farm/plot name
* Crop name
* Location
* Optional note
* Date

The application can also request the device's current GPS coordinates using the Geolocator package.

### 13.9 Talk to Expert

The Talk to Expert section provides agricultural assistance options.

It includes:

* Agricultural helpline
* Email consultation
* Question submission interface
* Agricultural guidance/disclaimer

The application provides this section as an additional support feature and does not replace professional agricultural consultation.

### 13.10 Feedback

The Feedback section allows users to provide their experience and suggestions.

Feedback can include:

* Rating
* User comments
* Suggestions for improvement

The feedback data can be stored locally.

### 13.11 Settings

The Settings screen provides application preferences.

Available settings include:

* Notifications
* Dark mode
* Language selection
* Clear scan history
* About application

The application supports English and Urdu localization.

---

## 14. Localization

The application supports multiple languages using Flutter localization.

The localization files are:

```text
app_en.arb
app_ur.arb
```

English is provided through the English localization file, while Urdu translations are provided through the Urdu localization file.

The application uses `AppLocalizations` to display translated text throughout the interface.

The user can change the language from:

**Settings → Language → English / Urdu**

This makes the application more accessible to users who prefer Urdu.

---

## 15. Theme Management

The application supports both light and dark themes.

The theme is managed through:

```text
providers/theme_provider.dart
```

The user can change the theme from:

**Settings → Dark Mode**

The application updates its interface according to the selected theme.

---

## 16. Local Data Storage

The application uses **SharedPreferences** for local storage.

The following information can be stored locally:

* Scan history
* Crop notes
* Farm/plot information
* User feedback
* Application preferences where applicable

This allows basic application functionality without requiring a separate database server for these features.

---

## 17. Important Services

### 17.1 API Service

`api_service.dart` manages communication between the Flutter application and the FastAPI backend.

It sends the selected plant image to the backend prediction endpoint and receives the AI prediction response.

### 17.2 History Service

`history_service.dart` manages scan history.

It provides functions for:

* Saving scans
* Retrieving scans
* Deleting individual scans
* Clearing history

### 17.3 Weather Service

`weather_service.dart` communicates with the weather service/API and retrieves weather information.

The retrieved weather data is converted into a `WeatherModel`.

### 17.4 Image Service

`image_service.dart` provides image-related functionality used by the application.

### 17.5 PDF Service

`pdf_service.dart` generates a PDF report containing relevant crop analysis information.

The generated report can be shared using the application's sharing functionality.

---

## 18. Data Models

### Disease Model

The `DiseaseModel` represents AI prediction information.

It contains information such as:

* Disease/plant name
* Confidence
* Remedy
* Top predictions

### Weather Model

The `WeatherModel` represents weather information retrieved from the weather service.

It contains:

* City
* Temperature
* Humidity
* Weather condition

---

## 19. Disease Information Module

The application contains disease information that can be displayed according to the predicted disease.

The information may include:

* Disease name
* Cause
* Symptoms
* Prevention
* Recommended treatment/remedy

This information helps users understand the prediction instead of only receiving a disease name.

---

## 20. Remedy System

The backend contains a remedy mapping module:

```text
backend/remedies.py
```

The predicted disease label is matched with the corresponding remedy information.

The general process is:

```text
Predicted Disease
       ↓
Disease Label
       ↓
Remedy Mapping
       ↓
Recommended Guidance
       ↓
Flutter Result Screen
```

The remedy information is intended as general agricultural guidance and should be verified with a qualified agricultural professional when necessary.

---

## 21. Error Handling

The application includes handling for common situations such as:

* No image selected
* Camera/gallery errors
* Backend connection failure
* Invalid image
* Location permission denied
* Location services disabled
* Weather API failure
* Empty notes
* Empty farm information
* Failed phone/email launching

User-friendly messages and SnackBars are used where appropriate to inform the user about errors or required actions.

---

## 22. Security and Privacy Considerations

The application is designed to minimize unnecessary storage of user information.

Local application data is stored using SharedPreferences.

Location access is requested only when the user uses the current-location feature. GPS functionality depends on device permissions and location services.

The AI prediction system should be treated as an assistance tool rather than a definitive agricultural diagnosis.

---

## 23. Installation and Setup

### Flutter Setup

The project requires Flutter and Dart.

The application can be prepared using:

```text
Flutter 3.44.6
Dart 3.12.2
```

After opening the project, dependencies can be installed using:

```bash
flutter pub get
```

Localization files can be generated using:

```bash
flutter gen-l10n
```

The application can then be tested on the available Flutter platform.

### Backend Setup

The backend uses Python and FastAPI.

Required dependencies are listed in:

```text
backend/requirements.txt
```

The FastAPI backend can be started using Uvicorn.

The backend runs locally at:

```text
http://127.0.0.1:8000
```

The prediction endpoint is:

```text
/predict
```

---

## 24. Backend Prediction Endpoint

The backend provides a prediction API through FastAPI.

### Endpoint

```text
POST /predict
```

### Input

The endpoint receives an image file uploaded from the Flutter application.

### Processing

```text
Image
 ↓
Image Processor
 ↓
ResNet-50
 ↓
Class Probabilities
 ↓
Highest Probability Class
 ↓
Confidence Score
 ↓
Remedy Mapping
```

### Output

The API returns a JSON response containing prediction information.

Example:

```json
{
  "name": "Potato___Late_blight",
  "confidence": 0.95,
  "remedy": "Recommended treatment information",
  "top_predictions": []
}
```

---

## 25. User Interface Design

The application uses a simple agricultural theme with green as the primary color in major sections.

The design focuses on:

* Simple navigation
* Clear buttons
* Readable text
* Card-based information
* Meaningful icons
* Light and dark themes
* English and Urdu support
* Easy access to scanning

The interface is designed to be understandable for users with different levels of technical experience.

---

## 26. Testing Strategy

Testing is divided into several categories.

### Functional Testing

Each major feature is tested to verify that it performs its intended function.

Examples include:

* Camera
* Gallery
* Disease detection
* Result display
* History
* Notes
* Farm locations
* GPS
* Weather
* PDF generation
* Sharing
* Feedback
* Settings
* Localization

### Integration Testing

The connection between the Flutter application and FastAPI backend is tested.

The main integration flow is:

```text
Flutter
   ↓
API Request
   ↓
FastAPI
   ↓
AI Model
   ↓
JSON Response
   ↓
Flutter
```

### UI Testing

The application's screens are checked in both light and dark themes.

English and Urdu interfaces are also checked for:

* Correct text
* Alignment
* Readability
* RTL behavior
* Button visibility
* Layout consistency

### Device Testing

The application is tested on Windows during development and Android testing is performed as part of the final validation stage.

---

## 27. Final Validation Checklist

Before final submission, the following items should be verified:

* [ ] Application launches successfully.
* [ ] Splash screen works.
* [ ] Home Screen loads correctly.
* [ ] Camera works.
* [ ] Gallery selection works.
* [ ] AI disease prediction works.
* [ ] Confidence score is displayed.
* [ ] Disease information is displayed.
* [ ] Remedy is displayed.
* [ ] Weather information is displayed.
* [ ] Scan history works.
* [ ] Search and history filters work.
* [ ] Notes/calendar works.
* [ ] Farm/plot records work.
* [ ] GPS location detection works.
* [ ] Talk to Expert works.
* [ ] Disclaimer is displayed.
* [ ] Feedback works.
* [ ] English localization works.
* [ ] Urdu localization works.
* [ ] Dark mode works.
* [ ] PDF report generation works.
* [ ] Sharing functionality works.
* [ ] 20–30 image validation is completed.
* [ ] 4–6 user feedback testing is completed.
* [ ] Android final testing is completed.
* [ ] Final Windows build is generated.

---

## 28. Expected Project Outcome

The completed system provides an integrated agricultural assistance application that combines AI-based crop disease identification with supporting agricultural features.

The expected outcome is a functional application capable of:

1. Receiving plant/leaf images.
2. Sending images to an AI backend.
3. Predicting crop/plant conditions.
4. Displaying confidence scores.
5. Providing disease information.
6. Providing recommended remedies.
7. Displaying weather information.
8. Maintaining scan history.
9. Managing crop notes.
10. Managing farm/plot information.
11. Detecting current GPS coordinates.
12. Providing expert assistance options.
13. Collecting user feedback.
14. Supporting English and Urdu.
15. Generating PDF reports.
16. Supporting Android and Windows testing.

---

## 29. Project Status

The major application components have been implemented, including the Flutter frontend, FastAPI backend, AI disease detection, weather integration, scan history, notes/calendar, farm/plot location tagging, feedback, expert assistance, localization, settings, PDF generation, and sharing functionality.

The remaining final-stage activities include:

* Final 20–30 image validation
* 4–6 user feedback validation
* Documentation completion
* Freemium/business requirements documentation
* Demo video
* GitHub/model documentation
* Android final testing
* Final presentation preparation

---

## 30. Final Deliverables

The final project submission should contain:

```text
1. Flutter Application
2. FastAPI Backend
3. AI Model Integration
4. Source Code
5. Documentation
6. Testing Results
7. User Feedback Results
8. GitHub Repository
9. Model Card
10. Demo Video
11. Android Build/APK
12. Final Presentation
```

### Final Project Summary

The AI Crop Disease Detector & Local Agricultural Advisory System demonstrates the practical application of Artificial Intelligence in agriculture. The system combines computer vision, mobile application development, backend API development, weather services, GPS functionality, local data storage, and agricultural guidance into a single application.

The project provides a foundation that can be further expanded into a larger agricultural platform with offline AI, cloud synchronization, market information, interactive farm maps, real-time expert consultation, and improved local agricultural datasets.


## 31. Testing Results

The application was tested to verify the functionality of its major features. Testing focused on image scanning, AI prediction, result display, history, weather, location, notes, feedback, localization, PDF generation, and application settings.

### 31.1 Functional Testing Results

| Feature             | Expected Result                                      | Status |
| ------------------- | ---------------------------------------------------- | ------ |
| Application Launch  | Application starts successfully                      | Passed |
| Splash Screen       | Splash screen appears correctly                      | Passed |
| Camera              | User can capture a plant image                       | Passed |
| Gallery             | User can select an image                             | Passed |
| AI Detection        | Image is sent to backend and prediction is generated | Passed |
| Confidence Score    | Prediction confidence is displayed                   | Passed |
| Disease Information | Disease details are displayed                        | Passed |
| Remedy              | Recommended remedy is displayed                      | Passed |
| Weather             | Weather information is retrieved and displayed       | Passed |
| Scan History        | Successful scans are stored                          | Passed |
| Search              | History records can be searched                      | Passed |
| Filters             | Healthy/Diseased filters work                        | Passed |
| Notes               | Crop notes can be added and viewed                   | Passed |
| Calendar            | Notes can be associated with dates                   | Passed |
| Farm Location       | Farm/plot information can be saved                   | Passed |
| GPS                 | Current coordinates can be detected                  | Passed |
| Talk to Expert      | Expert assistance section opens correctly            | Passed |
| Feedback            | User feedback can be submitted                       | Passed |
| Settings            | Application settings can be managed                  | Passed |
| Dark Mode           | Dark theme works correctly                           | Passed |
| English             | English localization works                           | Passed |
| Urdu                | Urdu localization works                              | Passed |
| PDF                 | Analysis report can be generated                     | Passed |
| Sharing             | Generated report can be shared                       | Passed |

---

## 32. AI Image Validation

The AI disease detection feature should be validated using approximately **20–30 plant/leaf images**.

The validation should include images from different crops and different disease conditions.

### Validation Procedure

For each image:

1. Select or capture the plant image.
2. Send the image for analysis.
3. Record the predicted disease.
4. Record the confidence score.
5. Compare the prediction with the expected condition.
6. Check whether disease information is displayed.
7. Check whether the recommended remedy is displayed.
8. Check whether the result is saved in history.

### Image Validation Table

| Test Image | Crop/Plant | Expected Condition | Predicted Result | Confidence     | Result         |
| ---------- | ---------- | ------------------ | ---------------- | -------------- | -------------- |
| Image 01   | Potato     | To be recorded     | To be recorded   | To be recorded | Pending/Passed |
| Image 02   | Tomato     | To be recorded     | To be recorded   | To be recorded | Pending/Passed |
| Image 03   | Apple      | To be recorded     | To be recorded   | To be recorded | Pending/Passed |
| Image 04   | Plant      | To be recorded     | To be recorded   | To be recorded | Pending/Passed |
| Image 05   | Plant      | To be recorded     | To be recorded   | To be recorded | Pending/Passed |

The remaining images can be added to the table during final testing.

### Important Validation Note

AI predictions depend on image quality, lighting, camera angle, background, and similarity between the real image and the images used during model training.

Therefore, the validation results should be recorded using real images and should not be replaced with assumed accuracy values.

---

## 33. User Feedback Testing

The application should be evaluated by approximately **4–6 users**.

Users can provide feedback after using the major application features.

### Feedback Questions

Users can be asked:

1. Was the application easy to use?
2. Was the scanning process understandable?
3. Was the disease result easy to understand?
4. Was the confidence score useful?
5. Were the remedies helpful?
6. Was the weather information useful?
7. Which feature did you find most useful?
8. Did you face any problems while using the application?
9. What improvements would you suggest?

### User Feedback Record

| User   | Ease of Use    | Disease Result | Remedy         | Most Useful Feature | Suggestions    |
| ------ | -------------- | -------------- | -------------- | ------------------- | -------------- |
| User 1 | To be recorded | To be recorded | To be recorded | To be recorded      | To be recorded |
| User 2 | To be recorded | To be recorded | To be recorded | To be recorded      | To be recorded |
| User 3 | To be recorded | To be recorded | To be recorded | To be recorded      | To be recorded |
| User 4 | To be recorded | To be recorded | To be recorded | To be recorded      | To be recorded |
| User 5 | To be recorded | To be recorded | To be recorded | To be recorded      | To be recorded |
| User 6 | To be recorded | To be recorded | To be recorded | To be recorded      | To be recorded |

The table should be updated with actual user feedback after testing.

---

## 34. Performance Evaluation

The application performance was evaluated based on the responsiveness of the user interface and the time required for AI prediction.

The main factors considered were:

* Application startup time
* Image selection time
* Image upload time
* AI prediction response time
* Result screen loading
* Weather loading
* History loading
* PDF generation
* Overall UI responsiveness

Because AI prediction is performed through the backend, prediction time may vary depending on the computer/device, image size, network connection, and backend processing speed.

---

## 35. Error and Edge Case Testing

The application was designed to handle common user errors and unexpected conditions.

### Tested Conditions

* User opens Scan Screen without selecting an image.
* User cancels camera selection.
* User cancels gallery selection.
* Backend is unavailable.
* Internet connection is unavailable.
* Weather service fails.
* Location services are disabled.
* Location permission is denied.
* User attempts to save an empty note.
* User attempts to save incomplete farm information.
* Phone application is unavailable for the helpline.
* Email application is unavailable.
* User clears scan history.

The application displays appropriate messages or SnackBars where required.

---

## 36. Localization Testing

The application supports:

* English
* Urdu

Localization testing was performed to verify that translated text appears correctly.

The following areas should be checked:

* App title
* Home Screen
* Scan Screen
* Result Screen
* History
* Notes
* Farm Location
* Talk to Expert
* Feedback
* Settings
* About Screen
* Buttons
* Error messages
* Dialogs

### Urdu RTL Testing

The Urdu interface should also be checked for:

* Right-to-left text alignment
* Correct text direction
* Button positioning
* Text overflow
* Card layout
* Dialog layout
* Long translated strings

---

## 37. Freemium Business Model

The application can follow a **freemium business model**.

### Free Version

The free version can provide:

* Limited number of AI scans
* Basic disease information
* Basic remedies
* Weather information
* Scan history
* Notes
* Farm/plot management
* Basic feedback functionality

### Premium Version

A future premium version may provide:

* More or unlimited AI scans
* Advanced agricultural recommendations
* Detailed disease information
* Extended history
* Advanced weather-based recommendations
* Additional crop disease classes
* Premium expert consultation
* Cloud synchronization
* Advanced farm management

A possible future premium price range can be considered after market research.

---

## 38. Business Requirements

The system can be expanded into a commercial agricultural assistance platform.

### Target Users

The main target users include:

* Smallholder farmers
* Agricultural students
* Agriculture extension workers
* Farm owners
* Agricultural organizations
* Cooperatives

### Business Opportunities

Possible business opportunities include:

1. Premium subscriptions.
2. Agricultural organization partnerships.
3. Government agricultural department integration.
4. Expert consultation services.
5. Farm management services.
6. Agricultural product recommendations.
7. Institutional licensing.
8. Data-driven agricultural advisory services.

Any commercial pricing or partnerships should be finalized after proper market and regulatory research.

---

## 39. Project Scalability

The current system can be expanded to support a larger number of users.

Possible scalability improvements include:

* Cloud-based backend deployment.
* Cloud database.
* User authentication.
* Cloud image processing.
* Centralized user accounts.
* Cloud scan history.
* Model optimization.
* API load balancing.
* Caching.
* Monitoring and logging.

These improvements would allow the application to support more users than the current local development setup.

---

## 40. GitHub Repository

The source code can be maintained in a GitHub repository for version control and project sharing.

The repository should contain:

```text
ai_crop_disease_detector/
│
├── lib/
├── backend/
├── assets/
├── pubspec.yaml
├── README.md
└── documentation/
```

The repository README should explain:

* Project purpose
* Main features
* Technologies
* Installation steps
* Backend setup
* Flutter setup
* AI model information
* API usage
* Screenshots
* Testing information
* Limitations
* Future enhancements

Sensitive information such as API keys, passwords, private credentials, and personal user data should not be uploaded to the repository.

---

## 41. Model Card

A model card should be provided to document the AI model used by the application.

### Model Name

**ResNet-50 Plant Disease Classification Model**

### Model Purpose

The model is used to classify plant/leaf images into supported crop and disease categories.

### Input

The model receives an image of a plant or leaf.

### Output

The model produces class probabilities and the application selects the highest-probability prediction.

### Usage

The model is integrated into the FastAPI backend and used during the crop disease prediction process.

### Limitations

The model may perform poorly when:

* Images are unclear.
* Lighting is poor.
* The leaf is partially visible.
* The image contains unrelated objects.
* The crop/disease is outside the supported classes.
* Real-world conditions differ significantly from the model's training data.

### Responsible Use

The model should be considered an assistance tool. Its predictions should not be treated as a guaranteed professional diagnosis.

---

## 42. Demo Video

A short demonstration video should be prepared for the final project presentation.

### Recommended Demo Flow

```text
Application Launch
        ↓
Home Screen
        ↓
Open Scan
        ↓
Select/Capture Leaf Image
        ↓
AI Analysis
        ↓
Disease Result
        ↓
Remedy + Weather
        ↓
Save/View History
        ↓
Notes & Calendar
        ↓
Farm Location/GPS
        ↓
Talk to Expert
        ↓
Feedback
        ↓
Settings
        ↓
English/Urdu
        ↓
PDF Report
```

### Recommended Video Duration

Approximately **3–5 minutes** is sufficient for a concise project demonstration.

The video should clearly show the main working features rather than spending excessive time on every screen.

---

## 43. Final Presentation Structure

The final presentation can be organized into the following sections:

### Slide 1 — Title

**AI Crop Disease Detector & Local Agricultural Advisory System**

Include:

* Student name
* University/institution
* Internship/program
* Supervisor
* Date

### Slide 2 — Problem

Explain the agricultural disease identification problem and why early detection is important.

### Slide 3 — Proposed Solution

Explain how the AI-based application helps users identify crop diseases from plant images.

### Slide 4 — Objectives

Present the major project objectives.

### Slide 5 — Technologies

Include:

* Flutter
* Dart
* Python
* FastAPI
* ResNet-50
* Hugging Face
* SharedPreferences
* Weather API
* Geolocator

### Slide 6 — System Workflow

Show:

```text
Image
 ↓
Flutter
 ↓
FastAPI
 ↓
AI Model
 ↓
Prediction
 ↓
Remedy
 ↓
Weather
 ↓
Result
```

### Slide 7 — Main Features

Show screenshots of:

* Home
* Scan
* Result
* History
* Notes
* Farm Location
* Talk to Expert
* Settings

### Slide 8 — AI Model

Explain:

* ResNet-50
* Image classification
* Confidence score
* Top predictions
* Remedy mapping

### Slide 9 — Testing

Present actual results from the 20–30 image validation.

### Slide 10 — User Feedback

Present the actual feedback collected from 4–6 users.

### Slide 11 — Limitations

Mention important limitations such as image quality, internet dependency, GPS permissions, and model coverage.

### Slide 12 — Future Work

Mention:

* Offline AI
* More diseases
* Cloud synchronization
* Market integration
* Expert consultation
* Interactive farm maps

### Slide 13 — Conclusion

Summarize the project's contribution to AI-based agricultural assistance.

### Slide 14 — Demo

Show the application demonstration video or perform a live demonstration.

---

## 44. Final Submission Checklist

Before submitting the project, verify the following:

* [ ] Flutter source code is complete.
* [ ] Backend source code is complete.
* [ ] Requirements file is included.
* [ ] AI model integration works.
* [ ] Weather integration works.
* [ ] GPS functionality works.
* [ ] History works.
* [ ] Notes/calendar works.
* [ ] Farm location works.
* [ ] Talk to Expert works.
* [ ] Feedback works.
* [ ] English localization works.
* [ ] Urdu localization works.
* [ ] Dark mode works.
* [ ] PDF generation works.
* [ ] Sharing works.
* [ ] Disclaimer is included.
* [ ] 20–30 image validation is recorded.
* [ ] 4–6 user feedback results are recorded.
* [ ] GitHub repository is prepared.
* [ ] Model card is prepared.
* [ ] Demo video is prepared.
* [ ] Android final testing is completed.
* [ ] Windows final build is completed.
* [ ] Final presentation is completed.
* [ ] Documentation is finalized.

---

## 45. Final Project Completion Statement

The project has progressed from an initial AI-based disease detection concept to an integrated agricultural assistance application.

The system combines:

**Artificial Intelligence + Mobile Application + Backend API + Weather + GPS + Local Storage + Agricultural Guidance**

into a single platform.

The final stage focuses on validating the system with real images and users, preparing technical documentation, creating the GitHub repository and model documentation, recording the demonstration video, completing Android testing, and preparing the final presentation.

The completed project demonstrates the practical use of Artificial Intelligence and mobile technologies to provide accessible agricultural support and crop disease identification.


## 46. Appendix A — Application Screens

The application consists of multiple screens designed to provide an organized and user-friendly agricultural assistance experience.

### Main Application Screens

1. Splash Screen
2. Login Screen
3. Signup Screen
4. Home Screen
5. Scan Screen
6. Result Screen
7. History Screen
8. Notes and Calendar Screen
9. Farm/Plot Location Screen
10. Talk to Expert Screen
11. Feedback Screen
12. Settings Screen
13. About Screen

Screenshots of these interfaces should be included in the final documentation where available.

---

## 47. Appendix B — Screenshot Documentation

Screenshots should be captured from the working application and placed in the documentation.

### Recommended Screenshots

**Screenshot 1 — Splash Screen**

Shows the application startup interface.

**Screenshot 2 — Home Screen**

Shows the main dashboard and available features.

**Screenshot 3 — Scan Screen**

Shows camera and gallery options.

**Screenshot 4 — AI Analysis**

Shows the application processing a selected plant image.

**Screenshot 5 — Disease Result**

Shows disease name, confidence score, disease information and remedy.

**Screenshot 6 — Weather Information**

Shows weather information associated with the analysis.

**Screenshot 7 — Scan History**

Shows previously analyzed plant images and their results.

**Screenshot 8 — Notes and Calendar**

Shows the crop notes and calendar functionality.

**Screenshot 9 — Farm Location**

Shows saved farm/plot information and GPS location functionality.

**Screenshot 10 — Talk to Expert**

Shows the agricultural assistance interface.

**Screenshot 11 — Feedback**

Shows the user feedback interface.

**Screenshot 12 — Settings**

Shows language, theme, notifications and other settings.

**Screenshot 13 — Urdu Interface**

Shows the application in Urdu.

**Screenshot 14 — Dark Mode**

Shows the application using the dark theme.

**Screenshot 15 — PDF Report**

Shows the generated crop analysis report.

---

## 48. Appendix C — API Documentation

### Base URL

During local development, the backend runs at:

```text
http://127.0.0.1:8000
```

### Prediction Endpoint

```text
POST /predict
```

### Purpose

The `/predict` endpoint receives a plant/leaf image and performs AI-based disease classification.

### Request

The Flutter application sends an image file using a multipart HTTP request.

Conceptually:

```text
Flutter Application
       ↓
HTTP POST
       ↓
/predict
       ↓
Image File
```

### Response

The backend returns JSON containing prediction information.

Example:

```json
{
  "name": "Potato___Late_blight",
  "confidence": 0.95,
  "remedy": "Recommended treatment information",
  "top_predictions": []
}
```

### Response Fields

| Field             | Description                             |
| ----------------- | --------------------------------------- |
| `name`            | Predicted plant/disease class           |
| `confidence`      | Prediction confidence                   |
| `remedy`          | Recommended agricultural guidance       |
| `top_predictions` | Additional high-probability predictions |

---

## 49. Appendix D — Flutter Dependencies

The project uses Flutter packages to provide application functionality.

Major dependencies include:

| Package                 | Purpose                             |
| ----------------------- | ----------------------------------- |
| `flutter_localizations` | Application localization            |
| `intl`                  | Internationalization and formatting |
| `provider`              | State management                    |
| `image_picker`          | Camera and gallery images           |
| `http`                  | API communication                   |
| `shared_preferences`    | Local data storage                  |
| `share_plus`            | Sharing generated reports           |
| `fl_chart`              | Statistics/chart display            |
| `pdf`                   | PDF generation                      |
| `printing`              | PDF printing/sharing support        |
| `path_provider`         | Application file paths              |
| `geolocator`            | GPS location                        |
| `url_launcher`          | Phone/email links                   |

The exact package versions are maintained in the project's `pubspec.yaml` file.

---

## 50. Appendix E — Backend Dependencies

The backend dependencies are maintained in:

```text
backend/requirements.txt
```

The backend uses Python-based technologies for:

* FastAPI API development
* Uvicorn server
* Image processing
* PyTorch-based AI inference
* Hugging Face Transformers
* Supporting model dependencies

The exact versions should always be taken from the final `requirements.txt` file.

---

## 51. Appendix F — Development Environment

The application was developed and tested using the following environment:

### Software

* Flutter 3.44.6
* Dart 3.12.2
* Python
* FastAPI
* Uvicorn
* Visual Studio Code
* Windows

### Development Platforms

* Windows
* Android

### Backend

The backend was tested locally using:

```text
127.0.0.1:8000
```

The Flutter application communicates with the local backend during development.

---

## 52. Appendix G — Source Code Organization

The source code is organized according to functionality.

### Data

```text
lib/data/
```

Contains disease-related information.

### Models

```text
lib/models/
```

Contains data models such as:

* DiseaseModel
* WeatherModel

### Providers

```text
lib/providers/
```

Contains application state providers such as:

* ThemeProvider
* LocaleProvider

### Screens

```text
lib/screens/
```

Contains the application's user interface screens.

### Services

```text
lib/services/
```

Contains services for:

* API communication
* History
* Images
* PDF generation
* Weather

### Widgets

```text
lib/widgets/
```

Contains reusable UI components such as the statistics chart.

---

## 53. Appendix H — Backend Source Code Organization

The backend contains the following major files:

### `app.py`

Responsible for:

* FastAPI application
* Prediction endpoint
* Receiving uploaded images
* Running prediction
* Returning JSON response

### `model_loader.py`

Responsible for:

* Loading the AI model
* Loading the image processor
* Providing the model for inference

### `remedies.py`

Responsible for:

* Disease-to-remedy mapping
* Agricultural guidance

### `requirements.txt`

Contains backend dependencies required to run the API.

---

## 54. Appendix I — Local Storage

The application uses SharedPreferences for lightweight local storage.

Examples of locally stored data include:

```text
farm_locations
crop_notes
scan_history
```

The exact keys may vary according to the implementation.

Local storage provides persistence between application sessions without requiring a remote database.

---

## 55. Appendix J — GPS Location Process

The Farm/Plot Location feature uses the Geolocator package.

The process is:

```text
User selects "Use Current Location"
              ↓
Check GPS service
              ↓
Check location permission
              ↓
Request permission if required
              ↓
Get current coordinates
              ↓
Display latitude and longitude
              ↓
User can save farm/plot information
```

If location services are disabled or permission is denied, the application displays an appropriate message.

---

## 56. Appendix K — Weather Process

The weather feature follows this general process:

```text
User opens result
       ↓
Weather Service
       ↓
Weather API
       ↓
Weather JSON
       ↓
WeatherModel
       ↓
Result Screen
```

The application can display information such as:

* City
* Temperature
* Humidity
* Weather condition

Weather information depends on network connectivity and API availability.

---

## 57. Appendix L — PDF Report Process

The application can generate a PDF report from the crop analysis result.

The process is:

```text
Disease Result
      ↓
PDF Service
      ↓
Report Generation
      ↓
PDF File
      ↓
Share / Print
```

The report may contain:

* Plant/disease name
* Confidence
* Remedy
* Weather information
* Analysis details
* Plant image where supported

---

## 58. Appendix M — User Journey

A typical user journey is:

```text
Launch Application
        ↓
Home Screen
        ↓
Scan Plant
        ↓
Capture / Select Image
        ↓
AI Analysis
        ↓
View Result
        ↓
Read Disease Information
        ↓
View Remedy
        ↓
View Weather
        ↓
Save Result in History
        ↓
Generate PDF if Required
        ↓
Continue Using Other Features
```

The user can then access Notes, Farm Location, Expert Assistance, Feedback and Settings.

---

## 59. Appendix N — Accessibility and Usability

The application aims to provide an interface that is easy to understand.

Usability considerations include:

* Clear icons
* Descriptive labels
* Simple navigation
* Readable text
* Consistent button placement
* Clear error messages
* English and Urdu support
* Light and dark themes
* Large touch-friendly controls

These features help make the application easier to use for different types of users.

---

## 60. Appendix O — Responsible AI Considerations

The AI model is used as an assistance mechanism rather than as a replacement for agricultural professionals.

Important considerations include:

* Predictions may not always be correct.
* Confidence scores do not guarantee correctness.
* Images should be clear and relevant.
* Users should seek professional agricultural advice for serious crop problems.
* Remedy information should be treated as general guidance.
* The application should not encourage unsafe or inappropriate use of agricultural chemicals.

---

## 61. Appendix P — Maintenance and Updates

Future maintenance may include:

* Updating disease information.
* Updating remedy recommendations.
* Adding new crop classes.
* Improving translations.
* Updating dependencies.
* Improving model performance.
* Fixing application bugs.
* Updating weather integration.
* Improving user interface.
* Adding new agricultural features.

The modular project structure makes it easier to update individual components without redesigning the entire application.

---

## 62. Appendix Q — Final Documentation Structure

The complete documentation can be organized as follows:

```text
1. Project Title
2. Introduction
3. Problem Statement
4. Objectives
5. Technologies Used
6. Main Features
7. System Workflow
8. AI Model
9. Prediction Process
10. Backend
11. System Architecture
12. Project Folder Structure
13. Frontend Modules
14. Localization
15. Theme Management
16. Local Data Storage
17. Important Services
18. Data Models
19. Disease Information
20. Remedy System
21. Error Handling
22. Security and Privacy
23. Installation and Setup
24. API Documentation
25. User Interface Design
26. Testing Strategy
27. Final Validation Checklist
28. Expected Outcome
29. Project Status
30. Final Deliverables
31. Testing Results
32. AI Image Validation
33. User Feedback Testing
34. Performance Evaluation
35. Error and Edge Case Testing
36. Localization Testing
37. Freemium Business Model
38. Business Requirements
39. Project Scalability
40. GitHub Repository
41. Model Card
42. Demo Video
43. Final Presentation
44. Final Submission Checklist
45. Final Project Completion Statement
46. Application Screens
47. Screenshot Documentation
48. API Documentation
49. Flutter Dependencies
50. Backend Dependencies
51. Development Environment
52. Source Code Organization
53. Backend Organization
54. Local Storage
55. GPS Process
56. Weather Process
57. PDF Report Process
58. User Journey
59. Accessibility and Usability
60. Responsible AI
61. Maintenance and Updates
62. Final Documentation Structure
```

---

## 63. Final Documentation Note

The documentation should contain actual evidence wherever possible.

For example:

* Actual screenshots should be used instead of placeholder images.
* Actual AI testing results should be recorded instead of estimated accuracy.
* Actual user feedback should be entered after testing.
* Actual GitHub repository information should be added after repository creation.
* Actual demo video information should be added after recording.
* Final Android testing results should be recorded after testing.

This ensures that the documentation accurately represents the completed project.

---

# Final Documentation Completion

The technical documentation now covers:

**Project Overview → Features → Architecture → AI Model → Backend → Frontend → Services → Testing → Business Model → GitHub → Model Card → Demo → Presentation → Appendices**

The remaining work is primarily to **replace placeholders with actual evidence**, such as screenshots, testing results, user feedback, GitHub information, demo video and final Android testing results.


## Project Screens & User Interface

### 1. Splash Screen

The Splash Screen is displayed when the application starts. It introduces the application and provides a smooth transition to the main application.

### 2. Login & Signup Screen

The application provides Login and Signup screens for user access. Users can enter their account information and access the application.

### 3. Home Screen

The Home Screen acts as the main dashboard of the application. It provides access to the major features of the system, including:

* Crop scanning
* Scan history
* Weather information
* Farm/plot locations
* Notes and calendar
* Talk to Expert
* Settings

The dashboard also displays scan statistics such as total scans, healthy plants, and diseased plants.

### 4. Scan Screen

The Scan Screen allows users to select a plant or leaf image from the gallery or capture a new image using the camera.

After selecting an image, the user can start the AI-based disease detection process. The selected image is sent to the FastAPI backend for analysis.

### 5. Result Screen

The Result Screen displays the results generated by the AI model.

The screen provides:

* Plant/crop name
* Predicted disease
* Confidence score
* Top predictions
* Disease information
* Symptoms
* Cause
* Prevention information
* Recommended remedy
* Weather information

This allows users to understand the detected condition and receive useful agricultural guidance.

### 6. History Screen

The History Screen stores previous crop scan records locally.

Users can:

* View previous scans
* Search scan records
* Filter healthy and diseased results
* View confidence scores
* Delete individual records
* Clear the complete scan history

The application also uses scan records to display statistics on the Home Screen.

### 7. Notes & Calendar Screen

The Notes & Calendar screen allows users to maintain crop-related notes.

Users can:

* Add a new crop note
* Select a specific date
* View notes for the selected date
* Delete saved notes

The notes are stored locally so that they remain available when the application is reopened.

### 8. Farm & Plot Location Screen

The Farm & Plot Location screen allows users to organize information about their farms or agricultural plots.

Each farm record can contain:

* Farm/plot name
* Crop name
* Location
* Optional note
* Date added

The screen also provides a current GPS location option. When permission is granted, the application detects the device's latitude and longitude using the Geolocator package.

### 9. Talk to Expert Screen

The Talk to Expert screen provides users with options for obtaining agricultural assistance.

Users can access agricultural contact information and submit questions related to crop diseases or farming problems.

The screen also contains a disclaimer explaining that AI-generated information should not replace professional agricultural advice.

### 10. Feedback Screen

The Feedback Screen allows users to provide feedback about their experience with the application.

Users can submit:

* Rating
* Suggestions
* Comments about the application

The collected feedback can help identify usability issues and improve future versions of the application.

### 11. Settings Screen

The Settings Screen allows users to manage application preferences.

Available options include:

* Language selection
* Dark mode
* Notifications
* Clear scan history
* About application

The application supports both **English and Urdu** languages.

### 12. About Screen

The About Screen provides information about the application and its purpose.

It explains the role of Artificial Intelligence in crop disease detection and provides information about the project developed during the QAU internship.

## User Interface Design

The application uses a simple and user-friendly interface designed to make agricultural information easy to access.

The interface includes:

* Clear navigation
* Simple icons
* Card-based information sections
* Agricultural-themed visual elements
* Green color elements
* Light and dark themes
* English and Urdu localization
* Responsive Flutter layouts

The design focuses on providing important crop information in a clear and understandable manner while keeping the application simple for users with different levels of technical knowledge.

## Navigation Structure

The main navigation structure of the application can be summarized as:

**Splash Screen → Login/Signup → Home Screen → Main Features**

From the Home Screen, users can access:

**Scan → Result → History**

**Notes → Calendar → Saved Notes**

**Farm/Plot → Location → Saved Farm**

**Talk to Expert → Agricultural Assistance**

**Feedback → Rating & Suggestions**

**Settings → Language / Theme / Notifications / About**
