import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ur.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ur'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'AI Crop Disease Detector'**
  String get appTitle;

  /// No description provided for @scanCrop.
  ///
  /// In en, this message translates to:
  /// **'Scan Crop'**
  String get scanCrop;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Smart Farming'**
  String get welcome;

  /// No description provided for @tip.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Agricultural Tip'**
  String get tip;

  /// No description provided for @detectionResult.
  ///
  /// In en, this message translates to:
  /// **'AI Detection Result'**
  String get detectionResult;

  /// No description provided for @plant.
  ///
  /// In en, this message translates to:
  /// **'Plant'**
  String get plant;

  /// No description provided for @disease.
  ///
  /// In en, this message translates to:
  /// **'Disease'**
  String get disease;

  /// No description provided for @healthyPlant.
  ///
  /// In en, this message translates to:
  /// **'Healthy Plant'**
  String get healthyPlant;

  /// No description provided for @diseaseDetected.
  ///
  /// In en, this message translates to:
  /// **'Disease Detected'**
  String get diseaseDetected;

  /// No description provided for @confidence.
  ///
  /// In en, this message translates to:
  /// **'Confidence'**
  String get confidence;

  /// No description provided for @lowConfidence.
  ///
  /// In en, this message translates to:
  /// **'Confidence is low. Upload a clear image of the leaf for better accuracy.'**
  String get lowConfidence;

  /// No description provided for @confidenceStatus.
  ///
  /// In en, this message translates to:
  /// **'Confidence Status'**
  String get confidenceStatus;

  /// No description provided for @currentWeather.
  ///
  /// In en, this message translates to:
  /// **'Current Weather'**
  String get currentWeather;

  /// No description provided for @unableWeather.
  ///
  /// In en, this message translates to:
  /// **'Unable to get weather information.'**
  String get unableWeather;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @temperature.
  ///
  /// In en, this message translates to:
  /// **'Temperature'**
  String get temperature;

  /// No description provided for @humidity.
  ///
  /// In en, this message translates to:
  /// **'Humidity'**
  String get humidity;

  /// No description provided for @weather.
  ///
  /// In en, this message translates to:
  /// **'Weather'**
  String get weather;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @notificationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Get notifications about your plants and scans.'**
  String get notificationSubtitle;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @darkModeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Use dark theme in the app.'**
  String get darkModeSubtitle;

  /// No description provided for @clearHistory.
  ///
  /// In en, this message translates to:
  /// **'Clear History'**
  String get clearHistory;

  /// No description provided for @clearHistorySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Delete all saved scan history.'**
  String get clearHistorySubtitle;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @urdu.
  ///
  /// In en, this message translates to:
  /// **'Urdu'**
  String get urdu;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// No description provided for @aboutApp.
  ///
  /// In en, this message translates to:
  /// **'About App'**
  String get aboutApp;

  /// No description provided for @scanTitle.
  ///
  /// In en, this message translates to:
  /// **'Crop Disease Detection'**
  String get scanTitle;

  /// No description provided for @scanSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Take or upload a picture of a leaf'**
  String get scanSubtitle;

  /// No description provided for @noImageSelected.
  ///
  /// In en, this message translates to:
  /// **'No image selected'**
  String get noImageSelected;

  /// No description provided for @openCamera.
  ///
  /// In en, this message translates to:
  /// **'Open Camera'**
  String get openCamera;

  /// No description provided for @openGallery.
  ///
  /// In en, this message translates to:
  /// **'Open Gallery'**
  String get openGallery;

  /// No description provided for @detectDisease.
  ///
  /// In en, this message translates to:
  /// **'Detect Disease'**
  String get detectDisease;

  /// No description provided for @detecting.
  ///
  /// In en, this message translates to:
  /// **'Detecting...'**
  String get detecting;

  /// No description provided for @aiAnalyzing.
  ///
  /// In en, this message translates to:
  /// **'AI is analyzing your crop...'**
  String get aiAnalyzing;

  /// No description provided for @pleaseWait.
  ///
  /// In en, this message translates to:
  /// **'Please wait...'**
  String get pleaseWait;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// No description provided for @scanCompleted.
  ///
  /// In en, this message translates to:
  /// **'Scan completed successfully'**
  String get scanCompleted;

  /// No description provided for @cropAnalyzed.
  ///
  /// In en, this message translates to:
  /// **'Your crop has been successfully analyzed.'**
  String get cropAnalyzed;

  /// No description provided for @viewResult.
  ///
  /// In en, this message translates to:
  /// **'View Result'**
  String get viewResult;

  /// No description provided for @selectImageFirst.
  ///
  /// In en, this message translates to:
  /// **'Please select an image first.'**
  String get selectImageFirst;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @aboutDescription.
  ///
  /// In en, this message translates to:
  /// **'AI Crop Disease Detector is an intelligent application that helps farmers and agricultural students identify crop diseases using artificial intelligence.'**
  String get aboutDescription;

  /// No description provided for @features.
  ///
  /// In en, this message translates to:
  /// **'Features'**
  String get features;

  /// No description provided for @featureAiDetection.
  ///
  /// In en, this message translates to:
  /// **'AI Disease Detection'**
  String get featureAiDetection;

  /// No description provided for @featureCameraGallery.
  ///
  /// In en, this message translates to:
  /// **'Camera and Gallery Scanning'**
  String get featureCameraGallery;

  /// No description provided for @featureConfidence.
  ///
  /// In en, this message translates to:
  /// **'Confidence Score'**
  String get featureConfidence;

  /// No description provided for @featureWeather.
  ///
  /// In en, this message translates to:
  /// **'Weather Information'**
  String get featureWeather;

  /// No description provided for @featureDiseaseDetails.
  ///
  /// In en, this message translates to:
  /// **'Disease Details'**
  String get featureDiseaseDetails;

  /// No description provided for @featureRemedies.
  ///
  /// In en, this message translates to:
  /// **'Recommended Remedies'**
  String get featureRemedies;

  /// No description provided for @featureHistory.
  ///
  /// In en, this message translates to:
  /// **'Scan History'**
  String get featureHistory;

  /// No description provided for @featurePrediction.
  ///
  /// In en, this message translates to:
  /// **'Healthy or Diseased Plant Prediction'**
  String get featurePrediction;

  /// No description provided for @featureInterface.
  ///
  /// In en, this message translates to:
  /// **'Easy User Interface'**
  String get featureInterface;

  /// No description provided for @developer.
  ///
  /// In en, this message translates to:
  /// **'Developer'**
  String get developer;

  /// No description provided for @bsArtificialIntelligence.
  ///
  /// In en, this message translates to:
  /// **'BS Artificial Intelligence'**
  String get bsArtificialIntelligence;

  /// No description provided for @iqraUniversity.
  ///
  /// In en, this message translates to:
  /// **'Iqra University Islamabad'**
  String get iqraUniversity;

  /// No description provided for @technologyUsed.
  ///
  /// In en, this message translates to:
  /// **'Technology Used'**
  String get technologyUsed;

  /// No description provided for @qauInternship.
  ///
  /// In en, this message translates to:
  /// **'QAU Summer Internship 2026'**
  String get qauInternship;

  /// No description provided for @thankYouMessage.
  ///
  /// In en, this message translates to:
  /// **'Thank you for using AI Crop Disease Detector.\nOur goal is to help farmers by providing fast and accurate crop disease detection through artificial intelligence.'**
  String get thankYouMessage;

  /// No description provided for @copyright.
  ///
  /// In en, this message translates to:
  /// **'© 2026 AI Crop Disease Detector'**
  String get copyright;

  /// No description provided for @healthy.
  ///
  /// In en, this message translates to:
  /// **'Healthy'**
  String get healthy;

  /// No description provided for @highConfidence.
  ///
  /// In en, this message translates to:
  /// **'Confidence is high.'**
  String get highConfidence;

  /// No description provided for @mediumConfidence.
  ///
  /// In en, this message translates to:
  /// **'Confidence is medium.'**
  String get mediumConfidence;

  /// No description provided for @lowConfidenceStatus.
  ///
  /// In en, this message translates to:
  /// **'Confidence is low.'**
  String get lowConfidenceStatus;

  /// No description provided for @topPredictions.
  ///
  /// In en, this message translates to:
  /// **'AI Top 5 Predictions'**
  String get topPredictions;

  /// No description provided for @recommendedRemedy.
  ///
  /// In en, this message translates to:
  /// **'Recommended Remedy'**
  String get recommendedRemedy;

  /// No description provided for @cause.
  ///
  /// In en, this message translates to:
  /// **'Cause'**
  String get cause;

  /// No description provided for @symptoms.
  ///
  /// In en, this message translates to:
  /// **'Symptoms'**
  String get symptoms;

  /// No description provided for @organicTreatment.
  ///
  /// In en, this message translates to:
  /// **'Organic Treatment'**
  String get organicTreatment;

  /// No description provided for @chemicalTreatment.
  ///
  /// In en, this message translates to:
  /// **'Chemical Treatment'**
  String get chemicalTreatment;

  /// No description provided for @prevention.
  ///
  /// In en, this message translates to:
  /// **'Prevention'**
  String get prevention;

  /// No description provided for @downloadPdf.
  ///
  /// In en, this message translates to:
  /// **'Download PDF Report'**
  String get downloadPdf;

  /// No description provided for @reportTitle.
  ///
  /// In en, this message translates to:
  /// **'AI Crop Disease Detector Report'**
  String get reportTitle;

  /// No description provided for @shareReport.
  ///
  /// In en, this message translates to:
  /// **'Share Report'**
  String get shareReport;

  /// No description provided for @scanAgain.
  ///
  /// In en, this message translates to:
  /// **'Scan Again'**
  String get scanAgain;

  /// No description provided for @shareWindowOpened.
  ///
  /// In en, this message translates to:
  /// **'Share window opened. If no app appears, share the PDF manually.'**
  String get shareWindowOpened;

  /// No description provided for @unableToShare.
  ///
  /// In en, this message translates to:
  /// **'Unable to share report'**
  String get unableToShare;

  /// No description provided for @disclaimerTitle.
  ///
  /// In en, this message translates to:
  /// **'Important Disclaimer'**
  String get disclaimerTitle;

  /// No description provided for @disclaimerText.
  ///
  /// In en, this message translates to:
  /// **'This AI-generated result is for informational purposes only and may not always be accurate. Consult an agricultural expert before making treatment or crop-related decisions.'**
  String get disclaimerText;

  /// No description provided for @apple.
  ///
  /// In en, this message translates to:
  /// **'Apple'**
  String get apple;

  /// No description provided for @blueberry.
  ///
  /// In en, this message translates to:
  /// **'Blueberry'**
  String get blueberry;

  /// No description provided for @cherry.
  ///
  /// In en, this message translates to:
  /// **'Cherry'**
  String get cherry;

  /// No description provided for @corn.
  ///
  /// In en, this message translates to:
  /// **'Corn'**
  String get corn;

  /// No description provided for @grape.
  ///
  /// In en, this message translates to:
  /// **'Grape'**
  String get grape;

  /// No description provided for @potato.
  ///
  /// In en, this message translates to:
  /// **'Potato'**
  String get potato;

  /// No description provided for @tomato.
  ///
  /// In en, this message translates to:
  /// **'Tomato'**
  String get tomato;

  /// No description provided for @pepper.
  ///
  /// In en, this message translates to:
  /// **'Pepper'**
  String get pepper;

  /// No description provided for @orange.
  ///
  /// In en, this message translates to:
  /// **'Orange'**
  String get orange;

  /// No description provided for @peach.
  ///
  /// In en, this message translates to:
  /// **'Peach'**
  String get peach;

  /// No description provided for @squash.
  ///
  /// In en, this message translates to:
  /// **'Squash'**
  String get squash;

  /// No description provided for @strawberry.
  ///
  /// In en, this message translates to:
  /// **'Strawberry'**
  String get strawberry;

  /// No description provided for @raspberry.
  ///
  /// In en, this message translates to:
  /// **'Raspberry'**
  String get raspberry;

  /// No description provided for @appleScab.
  ///
  /// In en, this message translates to:
  /// **'Apple Scab'**
  String get appleScab;

  /// No description provided for @appleBlackRot.
  ///
  /// In en, this message translates to:
  /// **'Apple Black Rot'**
  String get appleBlackRot;

  /// No description provided for @cedarAppleRust.
  ///
  /// In en, this message translates to:
  /// **'Cedar Apple Rust'**
  String get cedarAppleRust;

  /// No description provided for @powderyMildew.
  ///
  /// In en, this message translates to:
  /// **'Powdery Mildew'**
  String get powderyMildew;

  /// No description provided for @grayLeafSpot.
  ///
  /// In en, this message translates to:
  /// **'Gray Leaf Spot'**
  String get grayLeafSpot;

  /// No description provided for @commonRust.
  ///
  /// In en, this message translates to:
  /// **'Common Rust'**
  String get commonRust;

  /// No description provided for @northernLeafBlight.
  ///
  /// In en, this message translates to:
  /// **'Northern Leaf Blight'**
  String get northernLeafBlight;

  /// No description provided for @grapeBlackRot.
  ///
  /// In en, this message translates to:
  /// **'Grape Black Rot'**
  String get grapeBlackRot;

  /// No description provided for @grapeEsca.
  ///
  /// In en, this message translates to:
  /// **'Grape Esca (Black Measles)'**
  String get grapeEsca;

  /// No description provided for @grapeLeafBlight.
  ///
  /// In en, this message translates to:
  /// **'Grape Leaf Blight'**
  String get grapeLeafBlight;

  /// No description provided for @potatoEarlyBlight.
  ///
  /// In en, this message translates to:
  /// **'Potato Early Blight'**
  String get potatoEarlyBlight;

  /// No description provided for @potatoLateBlight.
  ///
  /// In en, this message translates to:
  /// **'Potato Late Blight'**
  String get potatoLateBlight;

  /// No description provided for @tomatoEarlyBlight.
  ///
  /// In en, this message translates to:
  /// **'Tomato Early Blight'**
  String get tomatoEarlyBlight;

  /// No description provided for @tomatoLateBlight.
  ///
  /// In en, this message translates to:
  /// **'Tomato Late Blight'**
  String get tomatoLateBlight;

  /// No description provided for @bacterialSpot.
  ///
  /// In en, this message translates to:
  /// **'Bacterial Spot'**
  String get bacterialSpot;

  /// No description provided for @citrusGreening.
  ///
  /// In en, this message translates to:
  /// **'Citrus Greening'**
  String get citrusGreening;

  /// No description provided for @leafScorch.
  ///
  /// In en, this message translates to:
  /// **'Leaf Scorch'**
  String get leafScorch;

  /// No description provided for @causeAppleScab.
  ///
  /// In en, this message translates to:
  /// **'This is a fungal disease caused by Venturia inaequalis.'**
  String get causeAppleScab;

  /// No description provided for @causeAppleBlackRot.
  ///
  /// In en, this message translates to:
  /// **'This is a fungal disease caused by Botryosphaeria obtusa.'**
  String get causeAppleBlackRot;

  /// No description provided for @causeAppleRust.
  ///
  /// In en, this message translates to:
  /// **'This is a fungal disease caused by Gymnosporangium species.'**
  String get causeAppleRust;

  /// No description provided for @causePowderyMildew.
  ///
  /// In en, this message translates to:
  /// **'This is a fungal disease that produces a white powdery coating on the leaves.'**
  String get causePowderyMildew;

  /// No description provided for @causeGrayLeafSpot.
  ///
  /// In en, this message translates to:
  /// **'This is a fungal disease that causes gray spots on the leaves.'**
  String get causeGrayLeafSpot;

  /// No description provided for @causeCommonRust.
  ///
  /// In en, this message translates to:
  /// **'This is a fungal disease caused by species of Puccinia.'**
  String get causeCommonRust;

  /// No description provided for @causeNorthernLeafBlight.
  ///
  /// In en, this message translates to:
  /// **'This is a fungal disease caused by Exserohilum turcicum.'**
  String get causeNorthernLeafBlight;

  /// No description provided for @causeGrapeBlackRot.
  ///
  /// In en, this message translates to:
  /// **'This is a fungal disease caused by Guignardia bidwellii.'**
  String get causeGrapeBlackRot;

  /// No description provided for @causeGrapeEsca.
  ///
  /// In en, this message translates to:
  /// **'This is a fungal disease that affects grapevines.'**
  String get causeGrapeEsca;

  /// No description provided for @causeGrapeLeafBlight.
  ///
  /// In en, this message translates to:
  /// **'This is a fungal disease affecting the leaves of grape plants.'**
  String get causeGrapeLeafBlight;

  /// No description provided for @causePotatoEarlyBlight.
  ///
  /// In en, this message translates to:
  /// **'This is a fungal disease caused by species of Alternaria.'**
  String get causePotatoEarlyBlight;

  /// No description provided for @causePotatoLateBlight.
  ///
  /// In en, this message translates to:
  /// **'This is a disease caused by Phytophthora infestans.'**
  String get causePotatoLateBlight;

  /// No description provided for @causeTomatoEarlyBlight.
  ///
  /// In en, this message translates to:
  /// **'This is a fungal disease caused by Alternaria.'**
  String get causeTomatoEarlyBlight;

  /// No description provided for @causeTomatoLateBlight.
  ///
  /// In en, this message translates to:
  /// **'This is a disease caused by Phytophthora infestans.'**
  String get causeTomatoLateBlight;

  /// No description provided for @causeBacterialSpot.
  ///
  /// In en, this message translates to:
  /// **'This is a bacterial disease that affects plants.'**
  String get causeBacterialSpot;

  /// No description provided for @causeCitrusGreening.
  ///
  /// In en, this message translates to:
  /// **'This is a bacterial disease that affects citrus plants.'**
  String get causeCitrusGreening;

  /// No description provided for @causeLeafScorch.
  ///
  /// In en, this message translates to:
  /// **'This is a fungal disease affecting strawberry leaves.'**
  String get causeLeafScorch;

  /// No description provided for @healthyCause.
  ///
  /// In en, this message translates to:
  /// **'This is a healthy plant and no disease has been detected.'**
  String get healthyCause;

  /// No description provided for @healthySymptoms.
  ///
  /// In en, this message translates to:
  /// **'Green leaves, normal growth, and healthy fruits.'**
  String get healthySymptoms;

  /// No description provided for @healthyOrganic.
  ///
  /// In en, this message translates to:
  /// **'Use organic fertilizer and maintain proper irrigation.'**
  String get healthyOrganic;

  /// No description provided for @healthyChemical.
  ///
  /// In en, this message translates to:
  /// **'No chemical treatment is required.'**
  String get healthyChemical;

  /// No description provided for @healthyPrevention.
  ///
  /// In en, this message translates to:
  /// **'Monitor the plant regularly and keep the field clean.'**
  String get healthyPrevention;

  /// No description provided for @appleScabSymptom1.
  ///
  /// In en, this message translates to:
  /// **'Olive-green spots on leaves'**
  String get appleScabSymptom1;

  /// No description provided for @appleScabSymptom2.
  ///
  /// In en, this message translates to:
  /// **'Dark spots on fruits'**
  String get appleScabSymptom2;

  /// No description provided for @appleScabSymptom3.
  ///
  /// In en, this message translates to:
  /// **'Premature leaf drop'**
  String get appleScabSymptom3;

  /// No description provided for @appleScabOrganic1.
  ///
  /// In en, this message translates to:
  /// **'Spray neem oil'**
  String get appleScabOrganic1;

  /// No description provided for @appleScabOrganic2.
  ///
  /// In en, this message translates to:
  /// **'Remove affected leaves'**
  String get appleScabOrganic2;

  /// No description provided for @appleScabOrganic3.
  ///
  /// In en, this message translates to:
  /// **'Use compost fertilizer'**
  String get appleScabOrganic3;

  /// No description provided for @appleScabChemical1.
  ///
  /// In en, this message translates to:
  /// **'Use a mancozeb fungicide'**
  String get appleScabChemical1;

  /// No description provided for @appleScabChemical2.
  ///
  /// In en, this message translates to:
  /// **'Use a copper-based fungicide'**
  String get appleScabChemical2;

  /// No description provided for @appleScabPrevention1.
  ///
  /// In en, this message translates to:
  /// **'Maintain orchard cleanliness'**
  String get appleScabPrevention1;

  /// No description provided for @appleScabPrevention2.
  ///
  /// In en, this message translates to:
  /// **'Avoid overhead watering'**
  String get appleScabPrevention2;

  /// No description provided for @appleScabPrevention3.
  ///
  /// In en, this message translates to:
  /// **'Maintain proper spacing between plants'**
  String get appleScabPrevention3;

  /// No description provided for @blackRotSymptom1.
  ///
  /// In en, this message translates to:
  /// **'Black rotten spots on fruits'**
  String get blackRotSymptom1;

  /// No description provided for @blackRotSymptom2.
  ///
  /// In en, this message translates to:
  /// **'Spots on leaves'**
  String get blackRotSymptom2;

  /// No description provided for @blackRotSymptom3.
  ///
  /// In en, this message translates to:
  /// **'Damage to branches'**
  String get blackRotSymptom3;

  /// No description provided for @blackRotOrganic1.
  ///
  /// In en, this message translates to:
  /// **'Remove affected fruits'**
  String get blackRotOrganic1;

  /// No description provided for @blackRotOrganic2.
  ///
  /// In en, this message translates to:
  /// **'Prune affected branches'**
  String get blackRotOrganic2;

  /// No description provided for @blackRotOrganic3.
  ///
  /// In en, this message translates to:
  /// **'Keep the orchard clean'**
  String get blackRotOrganic3;

  /// No description provided for @blackRotChemical1.
  ///
  /// In en, this message translates to:
  /// **'Use a recommended fungicide'**
  String get blackRotChemical1;

  /// No description provided for @blackRotChemical2.
  ///
  /// In en, this message translates to:
  /// **'Use a copper-based spray'**
  String get blackRotChemical2;

  /// No description provided for @blackRotPrevention1.
  ///
  /// In en, this message translates to:
  /// **'Remove fallen leaves'**
  String get blackRotPrevention1;

  /// No description provided for @blackRotPrevention2.
  ///
  /// In en, this message translates to:
  /// **'Prevent fruit injuries'**
  String get blackRotPrevention2;

  /// No description provided for @blackRotPrevention3.
  ///
  /// In en, this message translates to:
  /// **'Monitor regularly'**
  String get blackRotPrevention3;

  /// No description provided for @cedarAppleRustSymptom1.
  ///
  /// In en, this message translates to:
  /// **'Yellow or orange spots on leaves'**
  String get cedarAppleRustSymptom1;

  /// No description provided for @cedarAppleRustSymptom2.
  ///
  /// In en, this message translates to:
  /// **'Leaves begin to fall'**
  String get cedarAppleRustSymptom2;

  /// No description provided for @cedarAppleRustSymptom3.
  ///
  /// In en, this message translates to:
  /// **'Reduced fruit quality'**
  String get cedarAppleRustSymptom3;

  /// No description provided for @cedarAppleRustOrganic1.
  ///
  /// In en, this message translates to:
  /// **'Remove affected leaves'**
  String get cedarAppleRustOrganic1;

  /// No description provided for @cedarAppleRustOrganic2.
  ///
  /// In en, this message translates to:
  /// **'Use neem oil'**
  String get cedarAppleRustOrganic2;

  /// No description provided for @cedarAppleRustChemical1.
  ///
  /// In en, this message translates to:
  /// **'Use a mancozeb fungicide'**
  String get cedarAppleRustChemical1;

  /// No description provided for @cedarAppleRustPrevention1.
  ///
  /// In en, this message translates to:
  /// **'Maintain orchard cleanliness'**
  String get cedarAppleRustPrevention1;

  /// No description provided for @cedarAppleRustPrevention2.
  ///
  /// In en, this message translates to:
  /// **'Remove nearby affected plants'**
  String get cedarAppleRustPrevention2;

  /// No description provided for @powderyMildewSymptom1.
  ///
  /// In en, this message translates to:
  /// **'White powdery coating on leaves'**
  String get powderyMildewSymptom1;

  /// No description provided for @powderyMildewSymptom2.
  ///
  /// In en, this message translates to:
  /// **'Leaves curling'**
  String get powderyMildewSymptom2;

  /// No description provided for @powderyMildewSymptom3.
  ///
  /// In en, this message translates to:
  /// **'Weak plant growth'**
  String get powderyMildewSymptom3;

  /// No description provided for @powderyMildewOrganic1.
  ///
  /// In en, this message translates to:
  /// **'Use neem oil'**
  String get powderyMildewOrganic1;

  /// No description provided for @powderyMildewOrganic2.
  ///
  /// In en, this message translates to:
  /// **'Remove affected leaves'**
  String get powderyMildewOrganic2;

  /// No description provided for @powderyMildewOrganic3.
  ///
  /// In en, this message translates to:
  /// **'Improve air circulation'**
  String get powderyMildewOrganic3;

  /// No description provided for @powderyMildewChemical1.
  ///
  /// In en, this message translates to:
  /// **'Use a sulfur fungicide'**
  String get powderyMildewChemical1;

  /// No description provided for @powderyMildewChemical2.
  ///
  /// In en, this message translates to:
  /// **'Use a recommended fungicide'**
  String get powderyMildewChemical2;

  /// No description provided for @powderyMildewPrevention1.
  ///
  /// In en, this message translates to:
  /// **'Avoid excessive humidity'**
  String get powderyMildewPrevention1;

  /// No description provided for @powderyMildewPrevention2.
  ///
  /// In en, this message translates to:
  /// **'Maintain proper spacing between plants'**
  String get powderyMildewPrevention2;

  /// No description provided for @grayLeafSpotSymptom1.
  ///
  /// In en, this message translates to:
  /// **'Gray rectangular spots on leaves'**
  String get grayLeafSpotSymptom1;

  /// No description provided for @grayLeafSpotSymptom2.
  ///
  /// In en, this message translates to:
  /// **'Leaves drying'**
  String get grayLeafSpotSymptom2;

  /// No description provided for @grayLeafSpotSymptom3.
  ///
  /// In en, this message translates to:
  /// **'Reduced yield'**
  String get grayLeafSpotSymptom3;

  /// No description provided for @grayLeafSpotOrganic1.
  ///
  /// In en, this message translates to:
  /// **'Remove affected leaves'**
  String get grayLeafSpotOrganic1;

  /// No description provided for @grayLeafSpotOrganic2.
  ///
  /// In en, this message translates to:
  /// **'Improve soil health'**
  String get grayLeafSpotOrganic2;

  /// No description provided for @grayLeafSpotChemical1.
  ///
  /// In en, this message translates to:
  /// **'Use an appropriate fungicide'**
  String get grayLeafSpotChemical1;

  /// No description provided for @grayLeafSpotChemical2.
  ///
  /// In en, this message translates to:
  /// **'Use a recommended crop spray'**
  String get grayLeafSpotChemical2;

  /// No description provided for @grayLeafSpotPrevention1.
  ///
  /// In en, this message translates to:
  /// **'Practice crop rotation'**
  String get grayLeafSpotPrevention1;

  /// No description provided for @grayLeafSpotPrevention2.
  ///
  /// In en, this message translates to:
  /// **'Use resistant varieties'**
  String get grayLeafSpotPrevention2;

  /// No description provided for @commonRustSymptom1.
  ///
  /// In en, this message translates to:
  /// **'Rust-colored spots'**
  String get commonRustSymptom1;

  /// No description provided for @commonRustSymptom2.
  ///
  /// In en, this message translates to:
  /// **'Leaf damage'**
  String get commonRustSymptom2;

  /// No description provided for @commonRustSymptom3.
  ///
  /// In en, this message translates to:
  /// **'Reduced growth'**
  String get commonRustSymptom3;

  /// No description provided for @commonRustOrganic1.
  ///
  /// In en, this message translates to:
  /// **'Remove affected leaves'**
  String get commonRustOrganic1;

  /// No description provided for @commonRustOrganic2.
  ///
  /// In en, this message translates to:
  /// **'Keep the soil healthy'**
  String get commonRustOrganic2;

  /// No description provided for @commonRustChemical1.
  ///
  /// In en, this message translates to:
  /// **'Use a fungicide when needed'**
  String get commonRustChemical1;

  /// No description provided for @commonRustPrevention1.
  ///
  /// In en, this message translates to:
  /// **'Use resistant seeds'**
  String get commonRustPrevention1;

  /// No description provided for @commonRustPrevention2.
  ///
  /// In en, this message translates to:
  /// **'Avoid excessive humidity'**
  String get commonRustPrevention2;

  /// No description provided for @northernLeafBlightSymptom1.
  ///
  /// In en, this message translates to:
  /// **'Long gray spots on leaves'**
  String get northernLeafBlightSymptom1;

  /// No description provided for @northernLeafBlightSymptom2.
  ///
  /// In en, this message translates to:
  /// **'Leaves drying'**
  String get northernLeafBlightSymptom2;

  /// No description provided for @northernLeafBlightSymptom3.
  ///
  /// In en, this message translates to:
  /// **'Reduced crop yield'**
  String get northernLeafBlightSymptom3;

  /// No description provided for @northernLeafBlightOrganic1.
  ///
  /// In en, this message translates to:
  /// **'Remove affected parts'**
  String get northernLeafBlightOrganic1;

  /// No description provided for @northernLeafBlightOrganic2.
  ///
  /// In en, this message translates to:
  /// **'Improve field sanitation'**
  String get northernLeafBlightOrganic2;

  /// No description provided for @northernLeafBlightChemical1.
  ///
  /// In en, this message translates to:
  /// **'Use an appropriate fungicide'**
  String get northernLeafBlightChemical1;

  /// No description provided for @northernLeafBlightPrevention1.
  ///
  /// In en, this message translates to:
  /// **'Practice crop rotation'**
  String get northernLeafBlightPrevention1;

  /// No description provided for @northernLeafBlightPrevention2.
  ///
  /// In en, this message translates to:
  /// **'Use resistant varieties'**
  String get northernLeafBlightPrevention2;

  /// No description provided for @grapeBlackRotSymptom1.
  ///
  /// In en, this message translates to:
  /// **'Black spots on leaves'**
  String get grapeBlackRotSymptom1;

  /// No description provided for @grapeBlackRotSymptom2.
  ///
  /// In en, this message translates to:
  /// **'Fruit rotting'**
  String get grapeBlackRotSymptom2;

  /// No description provided for @grapeBlackRotSymptom3.
  ///
  /// In en, this message translates to:
  /// **'Leaf damage'**
  String get grapeBlackRotSymptom3;

  /// No description provided for @grapeBlackRotOrganic1.
  ///
  /// In en, this message translates to:
  /// **'Remove affected fruits'**
  String get grapeBlackRotOrganic1;

  /// No description provided for @grapeBlackRotOrganic2.
  ///
  /// In en, this message translates to:
  /// **'Prune affected parts'**
  String get grapeBlackRotOrganic2;

  /// No description provided for @grapeBlackRotChemical1.
  ///
  /// In en, this message translates to:
  /// **'Use a recommended fungicide'**
  String get grapeBlackRotChemical1;

  /// No description provided for @grapeBlackRotPrevention1.
  ///
  /// In en, this message translates to:
  /// **'Maintain grape orchard cleanliness'**
  String get grapeBlackRotPrevention1;

  /// No description provided for @grapeBlackRotPrevention2.
  ///
  /// In en, this message translates to:
  /// **'Avoid excessive humidity'**
  String get grapeBlackRotPrevention2;

  /// No description provided for @grapeEscaSymptom1.
  ///
  /// In en, this message translates to:
  /// **'Change in leaf color'**
  String get grapeEscaSymptom1;

  /// No description provided for @grapeEscaSymptom2.
  ///
  /// In en, this message translates to:
  /// **'Fruit damage'**
  String get grapeEscaSymptom2;

  /// No description provided for @grapeEscaSymptom3.
  ///
  /// In en, this message translates to:
  /// **'Weak vines'**
  String get grapeEscaSymptom3;

  /// No description provided for @grapeEscaOrganic1.
  ///
  /// In en, this message translates to:
  /// **'Remove affected vines'**
  String get grapeEscaOrganic1;

  /// No description provided for @grapeEscaOrganic2.
  ///
  /// In en, this message translates to:
  /// **'Prune affected parts'**
  String get grapeEscaOrganic2;

  /// No description provided for @grapeEscaChemical1.
  ///
  /// In en, this message translates to:
  /// **'Use a recommended fungicide'**
  String get grapeEscaChemical1;

  /// No description provided for @grapeEscaPrevention1.
  ///
  /// In en, this message translates to:
  /// **'Keep grapevines healthy'**
  String get grapeEscaPrevention1;

  /// No description provided for @grapeEscaPrevention2.
  ///
  /// In en, this message translates to:
  /// **'Remove affected material'**
  String get grapeEscaPrevention2;

  /// No description provided for @grapeLeafBlightSymptom1.
  ///
  /// In en, this message translates to:
  /// **'Brown spots on leaves'**
  String get grapeLeafBlightSymptom1;

  /// No description provided for @grapeLeafBlightSymptom2.
  ///
  /// In en, this message translates to:
  /// **'Leaves drying'**
  String get grapeLeafBlightSymptom2;

  /// No description provided for @grapeLeafBlightSymptom3.
  ///
  /// In en, this message translates to:
  /// **'Reduced growth'**
  String get grapeLeafBlightSymptom3;

  /// No description provided for @grapeLeafBlightOrganic1.
  ///
  /// In en, this message translates to:
  /// **'Remove affected leaves'**
  String get grapeLeafBlightOrganic1;

  /// No description provided for @grapeLeafBlightOrganic2.
  ///
  /// In en, this message translates to:
  /// **'Improve air circulation'**
  String get grapeLeafBlightOrganic2;

  /// No description provided for @grapeLeafBlightChemical1.
  ///
  /// In en, this message translates to:
  /// **'Apply a fungicide spray'**
  String get grapeLeafBlightChemical1;

  /// No description provided for @grapeLeafBlightPrevention1.
  ///
  /// In en, this message translates to:
  /// **'Keep the grape orchard clean'**
  String get grapeLeafBlightPrevention1;

  /// No description provided for @grapeLeafBlightPrevention2.
  ///
  /// In en, this message translates to:
  /// **'Avoid keeping leaves wet'**
  String get grapeLeafBlightPrevention2;

  /// No description provided for @potatoEarlyBlightSymptom1.
  ///
  /// In en, this message translates to:
  /// **'Brown circular spots'**
  String get potatoEarlyBlightSymptom1;

  /// No description provided for @potatoEarlyBlightSymptom2.
  ///
  /// In en, this message translates to:
  /// **'Leaves turning yellow'**
  String get potatoEarlyBlightSymptom2;

  /// No description provided for @potatoEarlyBlightSymptom3.
  ///
  /// In en, this message translates to:
  /// **'Leaf drop'**
  String get potatoEarlyBlightSymptom3;

  /// No description provided for @potatoEarlyBlightOrganic1.
  ///
  /// In en, this message translates to:
  /// **'Remove affected leaves'**
  String get potatoEarlyBlightOrganic1;

  /// No description provided for @potatoEarlyBlightOrganic2.
  ///
  /// In en, this message translates to:
  /// **'Improve soil health'**
  String get potatoEarlyBlightOrganic2;

  /// No description provided for @potatoEarlyBlightChemical1.
  ///
  /// In en, this message translates to:
  /// **'Use chlorothalonil'**
  String get potatoEarlyBlightChemical1;

  /// No description provided for @potatoEarlyBlightChemical2.
  ///
  /// In en, this message translates to:
  /// **'Use mancozeb'**
  String get potatoEarlyBlightChemical2;

  /// No description provided for @potatoEarlyBlightPrevention1.
  ///
  /// In en, this message translates to:
  /// **'Practice crop rotation'**
  String get potatoEarlyBlightPrevention1;

  /// No description provided for @potatoEarlyBlightPrevention2.
  ///
  /// In en, this message translates to:
  /// **'Maintain field cleanliness'**
  String get potatoEarlyBlightPrevention2;

  /// No description provided for @potatoLateBlightSymptom1.
  ///
  /// In en, this message translates to:
  /// **'Brown spots on leaves'**
  String get potatoLateBlightSymptom1;

  /// No description provided for @potatoLateBlightSymptom2.
  ///
  /// In en, this message translates to:
  /// **'Leaves drying'**
  String get potatoLateBlightSymptom2;

  /// No description provided for @potatoLateBlightSymptom3.
  ///
  /// In en, this message translates to:
  /// **'Black spots on stems'**
  String get potatoLateBlightSymptom3;

  /// No description provided for @potatoLateBlightOrganic1.
  ///
  /// In en, this message translates to:
  /// **'Remove affected leaves'**
  String get potatoLateBlightOrganic1;

  /// No description provided for @potatoLateBlightOrganic2.
  ///
  /// In en, this message translates to:
  /// **'Avoid overhead watering'**
  String get potatoLateBlightOrganic2;

  /// No description provided for @potatoLateBlightChemical1.
  ///
  /// In en, this message translates to:
  /// **'Use mancozeb'**
  String get potatoLateBlightChemical1;

  /// No description provided for @potatoLateBlightChemical2.
  ///
  /// In en, this message translates to:
  /// **'Use a metalaxyl fungicide'**
  String get potatoLateBlightChemical2;

  /// No description provided for @potatoLateBlightPrevention1.
  ///
  /// In en, this message translates to:
  /// **'Use healthy seeds'**
  String get potatoLateBlightPrevention1;

  /// No description provided for @potatoLateBlightPrevention2.
  ///
  /// In en, this message translates to:
  /// **'Avoid excessive humidity'**
  String get potatoLateBlightPrevention2;

  /// No description provided for @potatoLateBlightPrevention3.
  ///
  /// In en, this message translates to:
  /// **'Practice crop rotation'**
  String get potatoLateBlightPrevention3;

  /// No description provided for @tomatoEarlyBlightSymptom1.
  ///
  /// In en, this message translates to:
  /// **'Brown spots on leaves'**
  String get tomatoEarlyBlightSymptom1;

  /// No description provided for @tomatoEarlyBlightSymptom2.
  ///
  /// In en, this message translates to:
  /// **'Leaves turning yellow'**
  String get tomatoEarlyBlightSymptom2;

  /// No description provided for @tomatoEarlyBlightSymptom3.
  ///
  /// In en, this message translates to:
  /// **'Spots on fruits'**
  String get tomatoEarlyBlightSymptom3;

  /// No description provided for @tomatoEarlyBlightOrganic1.
  ///
  /// In en, this message translates to:
  /// **'Remove affected leaves'**
  String get tomatoEarlyBlightOrganic1;

  /// No description provided for @tomatoEarlyBlightOrganic2.
  ///
  /// In en, this message translates to:
  /// **'Use neem oil'**
  String get tomatoEarlyBlightOrganic2;

  /// No description provided for @tomatoEarlyBlightChemical1.
  ///
  /// In en, this message translates to:
  /// **'Use chlorothalonil'**
  String get tomatoEarlyBlightChemical1;

  /// No description provided for @tomatoEarlyBlightChemical2.
  ///
  /// In en, this message translates to:
  /// **'Use mancozeb'**
  String get tomatoEarlyBlightChemical2;

  /// No description provided for @tomatoEarlyBlightPrevention1.
  ///
  /// In en, this message translates to:
  /// **'Practice crop rotation'**
  String get tomatoEarlyBlightPrevention1;

  /// No description provided for @tomatoEarlyBlightPrevention2.
  ///
  /// In en, this message translates to:
  /// **'Avoid overhead irrigation'**
  String get tomatoEarlyBlightPrevention2;

  /// No description provided for @tomatoLateBlightSymptom1.
  ///
  /// In en, this message translates to:
  /// **'Dark spots on leaves'**
  String get tomatoLateBlightSymptom1;

  /// No description provided for @tomatoLateBlightSymptom2.
  ///
  /// In en, this message translates to:
  /// **'Fruit damage'**
  String get tomatoLateBlightSymptom2;

  /// No description provided for @tomatoLateBlightSymptom3.
  ///
  /// In en, this message translates to:
  /// **'Rapid weakening of the plant'**
  String get tomatoLateBlightSymptom3;

  /// No description provided for @tomatoLateBlightOrganic1.
  ///
  /// In en, this message translates to:
  /// **'Remove affected leaves'**
  String get tomatoLateBlightOrganic1;

  /// No description provided for @tomatoLateBlightOrganic2.
  ///
  /// In en, this message translates to:
  /// **'Improve air circulation'**
  String get tomatoLateBlightOrganic2;

  /// No description provided for @tomatoLateBlightChemical1.
  ///
  /// In en, this message translates to:
  /// **'Use a copper-based fungicide'**
  String get tomatoLateBlightChemical1;

  /// No description provided for @tomatoLateBlightChemical2.
  ///
  /// In en, this message translates to:
  /// **'Use a recommended fungicide'**
  String get tomatoLateBlightChemical2;

  /// No description provided for @tomatoLateBlightPrevention1.
  ///
  /// In en, this message translates to:
  /// **'Avoid keeping leaves wet'**
  String get tomatoLateBlightPrevention1;

  /// No description provided for @tomatoLateBlightPrevention2.
  ///
  /// In en, this message translates to:
  /// **'Maintain proper spacing between plants'**
  String get tomatoLateBlightPrevention2;

  /// No description provided for @bacterialSpotSymptom1.
  ///
  /// In en, this message translates to:
  /// **'Black spots on leaves'**
  String get bacterialSpotSymptom1;

  /// No description provided for @bacterialSpotSymptom2.
  ///
  /// In en, this message translates to:
  /// **'Spots on fruits'**
  String get bacterialSpotSymptom2;

  /// No description provided for @bacterialSpotSymptom3.
  ///
  /// In en, this message translates to:
  /// **'Leaf damage'**
  String get bacterialSpotSymptom3;

  /// No description provided for @bacterialSpotOrganic1.
  ///
  /// In en, this message translates to:
  /// **'Remove affected leaves'**
  String get bacterialSpotOrganic1;

  /// No description provided for @bacterialSpotOrganic2.
  ///
  /// In en, this message translates to:
  /// **'Use neem oil'**
  String get bacterialSpotOrganic2;

  /// No description provided for @bacterialSpotChemical1.
  ///
  /// In en, this message translates to:
  /// **'Use a copper-based bactericide'**
  String get bacterialSpotChemical1;

  /// No description provided for @bacterialSpotPrevention1.
  ///
  /// In en, this message translates to:
  /// **'Use disease-free seeds'**
  String get bacterialSpotPrevention1;

  /// No description provided for @bacterialSpotPrevention2.
  ///
  /// In en, this message translates to:
  /// **'Avoid keeping leaves wet'**
  String get bacterialSpotPrevention2;

  /// No description provided for @citrusGreeningSymptom1.
  ///
  /// In en, this message translates to:
  /// **'Leaves turning yellow'**
  String get citrusGreeningSymptom1;

  /// No description provided for @citrusGreeningSymptom2.
  ///
  /// In en, this message translates to:
  /// **'Small fruits'**
  String get citrusGreeningSymptom2;

  /// No description provided for @citrusGreeningSymptom3.
  ///
  /// In en, this message translates to:
  /// **'Reduced fruit quality'**
  String get citrusGreeningSymptom3;

  /// No description provided for @citrusGreeningOrganic1.
  ///
  /// In en, this message translates to:
  /// **'Remove affected branches'**
  String get citrusGreeningOrganic1;

  /// No description provided for @citrusGreeningOrganic2.
  ///
  /// In en, this message translates to:
  /// **'Meet the plant\'s nutritional needs'**
  String get citrusGreeningOrganic2;

  /// No description provided for @citrusGreeningChemical1.
  ///
  /// In en, this message translates to:
  /// **'Control disease-spreading insects with a recommended spray'**
  String get citrusGreeningChemical1;

  /// No description provided for @citrusGreeningPrevention1.
  ///
  /// In en, this message translates to:
  /// **'Use disease-free plants'**
  String get citrusGreeningPrevention1;

  /// No description provided for @citrusGreeningPrevention2.
  ///
  /// In en, this message translates to:
  /// **'Monitor orange trees regularly'**
  String get citrusGreeningPrevention2;

  /// No description provided for @leafScorchSymptom1.
  ///
  /// In en, this message translates to:
  /// **'Purple-red spots on leaves'**
  String get leafScorchSymptom1;

  /// No description provided for @leafScorchSymptom2.
  ///
  /// In en, this message translates to:
  /// **'Leaves drying'**
  String get leafScorchSymptom2;

  /// No description provided for @leafScorchSymptom3.
  ///
  /// In en, this message translates to:
  /// **'Reduced growth'**
  String get leafScorchSymptom3;

  /// No description provided for @leafScorchOrganic1.
  ///
  /// In en, this message translates to:
  /// **'Remove affected leaves'**
  String get leafScorchOrganic1;

  /// No description provided for @leafScorchOrganic2.
  ///
  /// In en, this message translates to:
  /// **'Improve soil condition'**
  String get leafScorchOrganic2;

  /// No description provided for @leafScorchChemical1.
  ///
  /// In en, this message translates to:
  /// **'Use a recommended fungicide'**
  String get leafScorchChemical1;

  /// No description provided for @leafScorchPrevention1.
  ///
  /// In en, this message translates to:
  /// **'Maintain field cleanliness'**
  String get leafScorchPrevention1;

  /// No description provided for @leafScorchPrevention2.
  ///
  /// In en, this message translates to:
  /// **'Avoid excessive humidity'**
  String get leafScorchPrevention2;

  /// No description provided for @blueberryHealthyCause.
  ///
  /// In en, this message translates to:
  /// **'This is a healthy blueberry plant.'**
  String get blueberryHealthyCause;

  /// No description provided for @blueberryHealthySymptoms.
  ///
  /// In en, this message translates to:
  /// **'Fresh green leaves, normal growth, and healthy stems.'**
  String get blueberryHealthySymptoms;

  /// No description provided for @cherryHealthyCause.
  ///
  /// In en, this message translates to:
  /// **'This is a healthy cherry plant.'**
  String get cherryHealthyCause;

  /// No description provided for @cherryHealthySymptoms.
  ///
  /// In en, this message translates to:
  /// **'Green leaves and normal growth.'**
  String get cherryHealthySymptoms;

  /// No description provided for @cornHealthyCause.
  ///
  /// In en, this message translates to:
  /// **'This is a healthy corn plant.'**
  String get cornHealthyCause;

  /// No description provided for @cornHealthySymptoms.
  ///
  /// In en, this message translates to:
  /// **'Green leaves and normal growth.'**
  String get cornHealthySymptoms;

  /// No description provided for @grapeHealthyCause.
  ///
  /// In en, this message translates to:
  /// **'This is a healthy grape plant.'**
  String get grapeHealthyCause;

  /// No description provided for @grapeHealthySymptoms.
  ///
  /// In en, this message translates to:
  /// **'Fresh green leaves and normal growth.'**
  String get grapeHealthySymptoms;

  /// No description provided for @potatoHealthyCause.
  ///
  /// In en, this message translates to:
  /// **'This is a healthy potato plant.'**
  String get potatoHealthyCause;

  /// No description provided for @potatoHealthySymptoms.
  ///
  /// In en, this message translates to:
  /// **'Green leaves and normal plant growth.'**
  String get potatoHealthySymptoms;

  /// No description provided for @tomatoHealthyCause.
  ///
  /// In en, this message translates to:
  /// **'This is a healthy tomato plant.'**
  String get tomatoHealthyCause;

  /// No description provided for @tomatoHealthySymptoms.
  ///
  /// In en, this message translates to:
  /// **'Green leaves, normal growth, and healthy fruits.'**
  String get tomatoHealthySymptoms;

  /// No description provided for @pepperHealthyCause.
  ///
  /// In en, this message translates to:
  /// **'This is a healthy pepper plant.'**
  String get pepperHealthyCause;

  /// No description provided for @pepperHealthySymptoms.
  ///
  /// In en, this message translates to:
  /// **'Green leaves and normal fruit growth.'**
  String get pepperHealthySymptoms;

  /// No description provided for @orangeHealthyCause.
  ///
  /// In en, this message translates to:
  /// **'This is a healthy orange plant.'**
  String get orangeHealthyCause;

  /// No description provided for @orangeHealthySymptoms.
  ///
  /// In en, this message translates to:
  /// **'Green leaves, normal growth, and healthy fruits.'**
  String get orangeHealthySymptoms;

  /// No description provided for @peachHealthyCause.
  ///
  /// In en, this message translates to:
  /// **'This is a healthy peach plant.'**
  String get peachHealthyCause;

  /// No description provided for @peachHealthySymptoms.
  ///
  /// In en, this message translates to:
  /// **'Green leaves and normal fruit growth.'**
  String get peachHealthySymptoms;

  /// No description provided for @squashHealthyCause.
  ///
  /// In en, this message translates to:
  /// **'This is a healthy squash plant.'**
  String get squashHealthyCause;

  /// No description provided for @squashHealthySymptoms.
  ///
  /// In en, this message translates to:
  /// **'Green leaves and normal growth.'**
  String get squashHealthySymptoms;

  /// No description provided for @strawberryHealthyCause.
  ///
  /// In en, this message translates to:
  /// **'This is a healthy strawberry plant.'**
  String get strawberryHealthyCause;

  /// No description provided for @strawberryHealthySymptoms.
  ///
  /// In en, this message translates to:
  /// **'Green leaves, healthy fruits, and normal growth.'**
  String get strawberryHealthySymptoms;

  /// No description provided for @noChemicalTreatment.
  ///
  /// In en, this message translates to:
  /// **'No chemical treatment is required.'**
  String get noChemicalTreatment;

  /// No description provided for @regularMonitoring.
  ///
  /// In en, this message translates to:
  /// **'Monitor the plant regularly.'**
  String get regularMonitoring;

  /// No description provided for @maintainIrrigation.
  ///
  /// In en, this message translates to:
  /// **'Maintain proper irrigation.'**
  String get maintainIrrigation;

  /// No description provided for @applyCompost.
  ///
  /// In en, this message translates to:
  /// **'Use organic compost.'**
  String get applyCompost;

  /// No description provided for @controlWeeds.
  ///
  /// In en, this message translates to:
  /// **'Control weeds.'**
  String get controlWeeds;

  /// No description provided for @keepFieldClean.
  ///
  /// In en, this message translates to:
  /// **'Keep the field clean.'**
  String get keepFieldClean;

  /// No description provided for @appleBlackRotSymptom1.
  ///
  /// In en, this message translates to:
  /// **'Black rotten spots on fruits'**
  String get appleBlackRotSymptom1;

  /// No description provided for @appleBlackRotSymptom2.
  ///
  /// In en, this message translates to:
  /// **'Black spots on leaves'**
  String get appleBlackRotSymptom2;

  /// No description provided for @appleBlackRotSymptom3.
  ///
  /// In en, this message translates to:
  /// **'Damage to branches'**
  String get appleBlackRotSymptom3;

  /// No description provided for @appleBlackRotOrganic1.
  ///
  /// In en, this message translates to:
  /// **'Remove affected fruits'**
  String get appleBlackRotOrganic1;

  /// No description provided for @appleBlackRotOrganic2.
  ///
  /// In en, this message translates to:
  /// **'Prune affected branches'**
  String get appleBlackRotOrganic2;

  /// No description provided for @appleBlackRotOrganic3.
  ///
  /// In en, this message translates to:
  /// **'Keep the orchard clean'**
  String get appleBlackRotOrganic3;

  /// No description provided for @appleBlackRotChemical1.
  ///
  /// In en, this message translates to:
  /// **'Use a recommended fungicide'**
  String get appleBlackRotChemical1;

  /// No description provided for @appleBlackRotChemical2.
  ///
  /// In en, this message translates to:
  /// **'Use a copper-based fungicide spray'**
  String get appleBlackRotChemical2;

  /// No description provided for @appleBlackRotPrevention1.
  ///
  /// In en, this message translates to:
  /// **'Remove fallen leaves and fruits'**
  String get appleBlackRotPrevention1;

  /// No description provided for @appleBlackRotPrevention2.
  ///
  /// In en, this message translates to:
  /// **'Prevent fruit injuries'**
  String get appleBlackRotPrevention2;

  /// No description provided for @appleBlackRotPrevention3.
  ///
  /// In en, this message translates to:
  /// **'Monitor plants regularly'**
  String get appleBlackRotPrevention3;

  /// No description provided for @appleRustSymptom1.
  ///
  /// In en, this message translates to:
  /// **'Yellow or orange spots on leaves'**
  String get appleRustSymptom1;

  /// No description provided for @appleRustSymptom2.
  ///
  /// In en, this message translates to:
  /// **'Leaves begin to fall'**
  String get appleRustSymptom2;

  /// No description provided for @appleRustSymptom3.
  ///
  /// In en, this message translates to:
  /// **'Reduced fruit quality'**
  String get appleRustSymptom3;

  /// No description provided for @appleRustOrganic1.
  ///
  /// In en, this message translates to:
  /// **'Remove affected leaves'**
  String get appleRustOrganic1;

  /// No description provided for @appleRustOrganic2.
  ///
  /// In en, this message translates to:
  /// **'Use neem oil'**
  String get appleRustOrganic2;

  /// No description provided for @appleRustChemical1.
  ///
  /// In en, this message translates to:
  /// **'Use a mancozeb fungicide'**
  String get appleRustChemical1;

  /// No description provided for @appleRustPrevention1.
  ///
  /// In en, this message translates to:
  /// **'Maintain orchard cleanliness'**
  String get appleRustPrevention1;

  /// No description provided for @appleRustPrevention2.
  ///
  /// In en, this message translates to:
  /// **'Remove nearby affected plants'**
  String get appleRustPrevention2;

  /// No description provided for @appleHealthyCause.
  ///
  /// In en, this message translates to:
  /// **'This is a healthy apple plant and no disease has been detected.'**
  String get appleHealthyCause;

  /// No description provided for @appleHealthySymptoms.
  ///
  /// In en, this message translates to:
  /// **'Green leaves, normal growth, and healthy fruits.'**
  String get appleHealthySymptoms;

  /// No description provided for @clearHistoryConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to clear all scan history?'**
  String get clearHistoryConfirmation;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No description provided for @historyClearedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Scan history cleared successfully.'**
  String get historyClearedSuccessfully;

  /// No description provided for @talkToExpert.
  ///
  /// In en, this message translates to:
  /// **'Talk to Expert'**
  String get talkToExpert;

  /// No description provided for @talkToAgriculturalExpert.
  ///
  /// In en, this message translates to:
  /// **'Talk to an Agricultural Expert'**
  String get talkToAgriculturalExpert;

  /// No description provided for @expertDescription.
  ///
  /// In en, this message translates to:
  /// **'Get professional guidance about crop diseases, treatment, and crop care.'**
  String get expertDescription;

  /// No description provided for @contactExpert.
  ///
  /// In en, this message translates to:
  /// **'Contact Expert'**
  String get contactExpert;

  /// No description provided for @agriculturalHelpline.
  ///
  /// In en, this message translates to:
  /// **'Agricultural Helpline'**
  String get agriculturalHelpline;

  /// No description provided for @localAgricultureExpert.
  ///
  /// In en, this message translates to:
  /// **'Contact a local agriculture expert'**
  String get localAgricultureExpert;

  /// No description provided for @unableToOpenPhone.
  ///
  /// In en, this message translates to:
  /// **'Unable to open the phone dialer.'**
  String get unableToOpenPhone;

  /// No description provided for @emailConsultation.
  ///
  /// In en, this message translates to:
  /// **'Email Consultation'**
  String get emailConsultation;

  /// No description provided for @sendCropQuestion.
  ///
  /// In en, this message translates to:
  /// **'Send your crop-related question'**
  String get sendCropQuestion;

  /// No description provided for @emailSubject.
  ///
  /// In en, this message translates to:
  /// **'Crop Disease Consultation'**
  String get emailSubject;

  /// No description provided for @emailBody.
  ///
  /// In en, this message translates to:
  /// **'I need help regarding my crop problem.'**
  String get emailBody;

  /// No description provided for @unableToOpenEmail.
  ///
  /// In en, this message translates to:
  /// **'Unable to open email application.'**
  String get unableToOpenEmail;

  /// No description provided for @askQuestion.
  ///
  /// In en, this message translates to:
  /// **'Ask a Question'**
  String get askQuestion;

  /// No description provided for @describeCropProblem.
  ///
  /// In en, this message translates to:
  /// **'Describe your crop problem here...'**
  String get describeCropProblem;

  /// No description provided for @questionReady.
  ///
  /// In en, this message translates to:
  /// **'Your question is ready for expert consultation.'**
  String get questionReady;

  /// No description provided for @submitQuestion.
  ///
  /// In en, this message translates to:
  /// **'Submit Question'**
  String get submitQuestion;

  /// No description provided for @expertTip.
  ///
  /// In en, this message translates to:
  /// **'Tip: For better expert guidance, provide a clear photo of the affected leaf and describe the symptoms.'**
  String get expertTip;

  /// No description provided for @notesCalendar.
  ///
  /// In en, this message translates to:
  /// **'Notes & Calendar'**
  String get notesCalendar;

  /// No description provided for @addNote.
  ///
  /// In en, this message translates to:
  /// **'Add Note'**
  String get addNote;

  /// No description provided for @cropCalendar.
  ///
  /// In en, this message translates to:
  /// **'Crop Calendar'**
  String get cropCalendar;

  /// No description provided for @selectedDate.
  ///
  /// In en, this message translates to:
  /// **'Selected Date'**
  String get selectedDate;

  /// No description provided for @notesForSelectedDate.
  ///
  /// In en, this message translates to:
  /// **'Notes for Selected Date'**
  String get notesForSelectedDate;

  /// No description provided for @noNotesForDate.
  ///
  /// In en, this message translates to:
  /// **'No notes for this date.'**
  String get noNotesForDate;

  /// No description provided for @addCropNote.
  ///
  /// In en, this message translates to:
  /// **'Add Crop Note'**
  String get addCropNote;

  /// No description provided for @writeCropNote.
  ///
  /// In en, this message translates to:
  /// **'Write your crop note here...'**
  String get writeCropNote;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @change.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get change;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @pleaseEnterNote.
  ///
  /// In en, this message translates to:
  /// **'Please enter a note.'**
  String get pleaseEnterNote;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @farmLocation.
  ///
  /// In en, this message translates to:
  /// **'Farm Location'**
  String get farmLocation;

  /// No description provided for @selectFarmLocation.
  ///
  /// In en, this message translates to:
  /// **'Select Farm Location'**
  String get selectFarmLocation;

  /// No description provided for @currentLocation.
  ///
  /// In en, this message translates to:
  /// **'Current Location'**
  String get currentLocation;

  /// No description provided for @locationSelected.
  ///
  /// In en, this message translates to:
  /// **'Location Selected'**
  String get locationSelected;

  /// No description provided for @feedback.
  ///
  /// In en, this message translates to:
  /// **'Feedback'**
  String get feedback;

  /// No description provided for @sendFeedback.
  ///
  /// In en, this message translates to:
  /// **'Send Feedback'**
  String get sendFeedback;

  /// No description provided for @writeFeedback.
  ///
  /// In en, this message translates to:
  /// **'Write your feedback here...'**
  String get writeFeedback;

  /// No description provided for @feedbackSent.
  ///
  /// In en, this message translates to:
  /// **'Feedback sent successfully.'**
  String get feedbackSent;

  /// No description provided for @feedbackTitle.
  ///
  /// In en, this message translates to:
  /// **'User Feedback'**
  String get feedbackTitle;

  /// No description provided for @helpUsImprove.
  ///
  /// In en, this message translates to:
  /// **'Help Us Improve'**
  String get helpUsImprove;

  /// No description provided for @shareExperience.
  ///
  /// In en, this message translates to:
  /// **'Please share your experience with the AI Crop Disease Detector.'**
  String get shareExperience;

  /// No description provided for @appEasyToUse.
  ///
  /// In en, this message translates to:
  /// **'1. Was the app easy to use?'**
  String get appEasyToUse;

  /// No description provided for @resultEasyToUnderstand.
  ///
  /// In en, this message translates to:
  /// **'2. Was the disease result easy to understand?'**
  String get resultEasyToUnderstand;

  /// No description provided for @remediesUseful.
  ///
  /// In en, this message translates to:
  /// **'3. Were the remedies useful?'**
  String get remediesUseful;

  /// No description provided for @scanningUseful.
  ///
  /// In en, this message translates to:
  /// **'4. How useful was the scanning feature?'**
  String get scanningUseful;

  /// No description provided for @mostUsefulFeature.
  ///
  /// In en, this message translates to:
  /// **'5. Which feature did you find most useful?'**
  String get mostUsefulFeature;

  /// No description provided for @anyProblemSuggestion.
  ///
  /// In en, this message translates to:
  /// **'6. Any problem or suggestion?'**
  String get anyProblemSuggestion;

  /// No description provided for @submitFeedback.
  ///
  /// In en, this message translates to:
  /// **'Submit Feedback'**
  String get submitFeedback;

  /// No description provided for @completeFeedback.
  ///
  /// In en, this message translates to:
  /// **'Please complete all required feedback fields.'**
  String get completeFeedback;

  /// No description provided for @feedbackSaved.
  ///
  /// In en, this message translates to:
  /// **'Thank you! Your feedback has been saved.'**
  String get feedbackSaved;

  /// No description provided for @diseaseDetection.
  ///
  /// In en, this message translates to:
  /// **'Disease Detection'**
  String get diseaseDetection;

  /// No description provided for @remedy.
  ///
  /// In en, this message translates to:
  /// **'Remedy'**
  String get remedy;

  /// No description provided for @farmPlotLocations.
  ///
  /// In en, this message translates to:
  /// **'Farm & Plot Locations'**
  String get farmPlotLocations;

  /// No description provided for @addFarm.
  ///
  /// In en, this message translates to:
  /// **'Add Farm'**
  String get addFarm;

  /// No description provided for @addFarmPlot.
  ///
  /// In en, this message translates to:
  /// **'Add Farm / Plot'**
  String get addFarmPlot;

  /// No description provided for @farmPlotName.
  ///
  /// In en, this message translates to:
  /// **'Farm / Plot Name'**
  String get farmPlotName;

  /// No description provided for @mainFarm.
  ///
  /// In en, this message translates to:
  /// **'e.g. Main Farm'**
  String get mainFarm;

  /// No description provided for @crop.
  ///
  /// In en, this message translates to:
  /// **'Crop'**
  String get crop;

  /// No description provided for @potatoExample.
  ///
  /// In en, this message translates to:
  /// **'e.g. Potato'**
  String get potatoExample;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @islamabadPakistan.
  ///
  /// In en, this message translates to:
  /// **'e.g. Islamabad, Pakistan'**
  String get islamabadPakistan;

  /// No description provided for @useCurrentLocation.
  ///
  /// In en, this message translates to:
  /// **'Use Current Location'**
  String get useCurrentLocation;

  /// No description provided for @optionalNote.
  ///
  /// In en, this message translates to:
  /// **'Optional Note'**
  String get optionalNote;

  /// No description provided for @plotInformation.
  ///
  /// In en, this message translates to:
  /// **'Add any information about this plot...'**
  String get plotInformation;

  /// No description provided for @noFarmPlotAdded.
  ///
  /// In en, this message translates to:
  /// **'No farm or plot added yet'**
  String get noFarmPlotAdded;

  /// No description provided for @organizeCropInformation.
  ///
  /// In en, this message translates to:
  /// **'Add your farm or plot location to organize your crop information.'**
  String get organizeCropInformation;

  /// No description provided for @cropLabel.
  ///
  /// In en, this message translates to:
  /// **'Crop'**
  String get cropLabel;

  /// No description provided for @locationLabel.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get locationLabel;

  /// No description provided for @noteLabel.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get noteLabel;

  /// No description provided for @added.
  ///
  /// In en, this message translates to:
  /// **'Added'**
  String get added;

  /// No description provided for @turnOnLocation.
  ///
  /// In en, this message translates to:
  /// **'Please turn on Location/GPS on your device.'**
  String get turnOnLocation;

  /// No description provided for @locationPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Location permission was denied.'**
  String get locationPermissionDenied;

  /// No description provided for @locationPermissionDeniedForever.
  ///
  /// In en, this message translates to:
  /// **'Location permission is permanently denied. Please enable it from device settings.'**
  String get locationPermissionDeniedForever;

  /// No description provided for @currentLocationDetected.
  ///
  /// In en, this message translates to:
  /// **'Current location detected successfully.'**
  String get currentLocationDetected;

  /// No description provided for @unableToGetLocation.
  ///
  /// In en, this message translates to:
  /// **'Unable to get current location'**
  String get unableToGetLocation;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ur'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ur':
      return AppLocalizationsUr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
