import 'dart:io';

import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../models/disease_model.dart';
import '../services/pdf_service.dart';
import '../services/weather_service.dart';
import '../models/weather_model.dart';

class ResultScreen extends StatefulWidget {
  final DiseaseModel disease;
  final File image;

  const ResultScreen({
    super.key,
    required this.disease,
    required this.image,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  WeatherModel? weather;
  bool weatherLoading = true;

  @override
  void initState() {
    super.initState();
    loadWeather();
  }

  Future<void> loadWeather() async {
    try {
      final result = await WeatherService().getWeather("Islamabad");

      if (mounted) {
        setState(() {
          weather = result;
          weatherLoading = false;
        });
      }
    } catch (_) {
      if (mounted) {
        setState(() {
          weatherLoading = false;
        });
      }
    }
  }

  String localizedPlantName(
    String name,
    AppLocalizations l10n,
  ) {
    final value = name.toLowerCase();

    if (value.contains("apple")) return l10n.apple;
    if (value.contains("blueberry")) return l10n.blueberry;
    if (value.contains("cherry")) return l10n.cherry;
    if (value.contains("corn")) return l10n.corn;
    if (value.contains("grape")) return l10n.grape;
    if (value.contains("potato")) return l10n.potato;
    if (value.contains("tomato")) return l10n.tomato;
    if (value.contains("pepper")) return l10n.pepper;
    if (value.contains("orange")) return l10n.orange;
    if (value.contains("peach")) return l10n.peach;
    if (value.contains("squash")) return l10n.squash;
    if (value.contains("strawberry")) return l10n.strawberry;
    if (value.contains("raspberry")) return l10n.raspberry;

    return name;
  }

  String localizedDiseaseName(
    String name,
    AppLocalizations l10n,
  ) {
    final value = name.toLowerCase();

    if (value.contains("apple") && value.contains("scab")) {
      return l10n.appleScab;
    }

    if (value.contains("apple") && value.contains("black rot")) {
      return l10n.appleBlackRot;
    }

    if (value.contains("cedar") && value.contains("rust")) {
      return l10n.cedarAppleRust;
    }

    if (value.contains("powdery mildew")) {
      return l10n.powderyMildew;
    }

    if (value.contains("gray leaf spot")) {
      return l10n.grayLeafSpot;
    }

    if (value.contains("common rust")) {
      return l10n.commonRust;
    }

    if (value.contains("northern leaf blight")) {
      return l10n.northernLeafBlight;
    }

    if (value.contains("grape") && value.contains("black rot")) {
      return l10n.grapeBlackRot;
    }

    if (value.contains("grape") && value.contains("esca")) {
      return l10n.grapeEsca;
    }

    if (value.contains("grape") && value.contains("leaf blight")) {
      return l10n.grapeLeafBlight;
    }

    if (value.contains("potato") && value.contains("early blight")) {
      return l10n.potatoEarlyBlight;
    }

    if (value.contains("potato") && value.contains("late blight")) {
      return l10n.potatoLateBlight;
    }

    if (value.contains("tomato") && value.contains("early blight")) {
      return l10n.tomatoEarlyBlight;
    }

    if (value.contains("tomato") && value.contains("late blight")) {
      return l10n.tomatoLateBlight;
    }

    if (value.contains("bacterial spot")) {
      return l10n.bacterialSpot;
    }

    if (value.contains("citrus greening")) {
      return l10n.citrusGreening;
    }

    if (value.contains("leaf scorch")) {
      return l10n.leafScorch;
    }

    return name;
  }

  String getCause(
    String name,
    AppLocalizations l10n,
  ) {
    final value = name.toLowerCase();

    if (value.contains("apple") && value.contains("scab")) {
      return l10n.causeAppleScab;
    }

    if (value.contains("apple") && value.contains("black rot")) {
      return l10n.causeAppleBlackRot;
    }

    if (value.contains("cedar") && value.contains("rust")) {
      return l10n.causeAppleRust;
    }

    if (value.contains("powdery mildew")) {
      return l10n.causePowderyMildew;
    }

    if (value.contains("gray leaf spot")) {
      return l10n.causeGrayLeafSpot;
    }

    if (value.contains("common rust")) {
      return l10n.causeCommonRust;
    }

    if (value.contains("northern leaf blight")) {
      return l10n.causeNorthernLeafBlight;
    }

    if (value.contains("grape") && value.contains("black rot")) {
      return l10n.causeGrapeBlackRot;
    }

    if (value.contains("grape") && value.contains("esca")) {
      return l10n.causeGrapeEsca;
    }

    if (value.contains("grape") && value.contains("leaf blight")) {
      return l10n.causeGrapeLeafBlight;
    }

    if (value.contains("potato") && value.contains("early blight")) {
      return l10n.causePotatoEarlyBlight;
    }

    if (value.contains("potato") && value.contains("late blight")) {
      return l10n.causePotatoLateBlight;
    }

    if (value.contains("tomato") && value.contains("early blight")) {
      return l10n.causeTomatoEarlyBlight;
    }

    if (value.contains("tomato") && value.contains("late blight")) {
      return l10n.causeTomatoLateBlight;
    }

    if (value.contains("bacterial spot")) {
      return l10n.causeBacterialSpot;
    }

    if (value.contains("citrus greening")) {
      return l10n.causeCitrusGreening;
    }

    if (value.contains("leaf scorch")) {
      return l10n.causeLeafScorch;
    }

    if (value.contains("healthy")) {
      return getHealthyCause(name, l10n);
    }

    return l10n.healthyCause;
  }

  String getHealthyCause(
    String name,
    AppLocalizations l10n,
  ) {
    final value = name.toLowerCase();

    if (value.contains("blueberry")) {
      return l10n.blueberryHealthyCause;
    }

    if (value.contains("cherry")) {
      return l10n.cherryHealthyCause;
    }

    if (value.contains("corn")) {
      return l10n.cornHealthyCause;
    }

    if (value.contains("grape")) {
      return l10n.grapeHealthyCause;
    }

    if (value.contains("potato")) {
      return l10n.potatoHealthyCause;
    }

    if (value.contains("tomato")) {
      return l10n.tomatoHealthyCause;
    }

    if (value.contains("pepper")) {
      return l10n.pepperHealthyCause;
    }

    if (value.contains("orange")) {
      return l10n.orangeHealthyCause;
    }

    if (value.contains("peach")) {
      return l10n.peachHealthyCause;
    }

    if (value.contains("squash")) {
      return l10n.squashHealthyCause;
    }

    if (value.contains("strawberry")) {
      return l10n.strawberryHealthyCause;
    }

    if (value.contains("apple")) {
      return l10n.appleHealthyCause;
    }

    return l10n.healthyCause;
  }

  String getHealthySymptoms(
    String name,
    AppLocalizations l10n,
  ) {
    final value = name.toLowerCase();

    if (value.contains("blueberry")) {
      return l10n.blueberryHealthySymptoms;
    }

    if (value.contains("cherry")) {
      return l10n.cherryHealthySymptoms;
    }

    if (value.contains("corn")) {
      return l10n.cornHealthySymptoms;
    }

    if (value.contains("grape")) {
      return l10n.grapeHealthySymptoms;
    }

    if (value.contains("potato")) {
      return l10n.potatoHealthySymptoms;
    }

    if (value.contains("tomato")) {
      return l10n.tomatoHealthySymptoms;
    }

    if (value.contains("pepper")) {
      return l10n.pepperHealthySymptoms;
    }

    if (value.contains("orange")) {
      return l10n.orangeHealthySymptoms;
    }

    if (value.contains("peach")) {
      return l10n.peachHealthySymptoms;
    }

    if (value.contains("squash")) {
      return l10n.squashHealthySymptoms;
    }

    if (value.contains("strawberry")) {
      return l10n.strawberryHealthySymptoms;
    }

    if (value.contains("apple")) {
      return l10n.appleHealthySymptoms;
    }

    return l10n.healthySymptoms;
  }

  List<String> getSymptoms(
    String name,
    AppLocalizations l10n,
  ) {
    final value = name.toLowerCase();

    if (value.contains("apple") && value.contains("scab")) {
      return [
        l10n.appleScabSymptom1,
        l10n.appleScabSymptom2,
        l10n.appleScabSymptom3,
      ];
    }

    if (value.contains("apple") && value.contains("black rot")) {
      return [
        l10n.appleBlackRotSymptom1,
        l10n.appleBlackRotSymptom2,
        l10n.appleBlackRotSymptom3,
      ];
    }

    if (value.contains("cedar") && value.contains("rust")) {
      return [
        l10n.cedarAppleRustSymptom1,
        l10n.cedarAppleRustSymptom2,
        l10n.cedarAppleRustSymptom3,
      ];
    }

    if (value.contains("powdery mildew")) {
      return [
        l10n.powderyMildewSymptom1,
        l10n.powderyMildewSymptom2,
        l10n.powderyMildewSymptom3,
      ];
    }

    if (value.contains("gray leaf spot")) {
      return [
        l10n.grayLeafSpotSymptom1,
        l10n.grayLeafSpotSymptom2,
        l10n.grayLeafSpotSymptom3,
      ];
    }

    if (value.contains("common rust")) {
      return [
        l10n.commonRustSymptom1,
        l10n.commonRustSymptom2,
        l10n.commonRustSymptom3,
      ];
    }

    if (value.contains("northern leaf blight")) {
      return [
        l10n.northernLeafBlightSymptom1,
        l10n.northernLeafBlightSymptom2,
        l10n.northernLeafBlightSymptom3,
      ];
    }

    if (value.contains("grape") && value.contains("black rot")) {
      return [
        l10n.grapeBlackRotSymptom1,
        l10n.grapeBlackRotSymptom2,
        l10n.grapeBlackRotSymptom3,
      ];
    }

    if (value.contains("grape") && value.contains("esca")) {
      return [
        l10n.grapeEscaSymptom1,
        l10n.grapeEscaSymptom2,
        l10n.grapeEscaSymptom3,
      ];
    }

    if (value.contains("grape") && value.contains("leaf blight")) {
      return [
        l10n.grapeLeafBlightSymptom1,
        l10n.grapeLeafBlightSymptom2,
        l10n.grapeLeafBlightSymptom3,
      ];
    }

    if (value.contains("potato") && value.contains("early blight")) {
      return [
        l10n.potatoEarlyBlightSymptom1,
        l10n.potatoEarlyBlightSymptom2,
        l10n.potatoEarlyBlightSymptom3,
      ];
    }

    if (value.contains("potato") && value.contains("late blight")) {
      return [
        l10n.potatoLateBlightSymptom1,
        l10n.potatoLateBlightSymptom2,
        l10n.potatoLateBlightSymptom3,
      ];
    }

    if (value.contains("tomato") && value.contains("early blight")) {
      return [
        l10n.tomatoEarlyBlightSymptom1,
        l10n.tomatoEarlyBlightSymptom2,
        l10n.tomatoEarlyBlightSymptom3,
      ];
    }

    if (value.contains("tomato") && value.contains("late blight")) {
      return [
        l10n.tomatoLateBlightSymptom1,
        l10n.tomatoLateBlightSymptom2,
        l10n.tomatoLateBlightSymptom3,
      ];
    }

    if (value.contains("bacterial spot")) {
      return [
        l10n.bacterialSpotSymptom1,
        l10n.bacterialSpotSymptom2,
        l10n.bacterialSpotSymptom3,
      ];
    }

    if (value.contains("citrus greening")) {
      return [
        l10n.citrusGreeningSymptom1,
        l10n.citrusGreeningSymptom2,
        l10n.citrusGreeningSymptom3,
      ];
    }

    if (value.contains("leaf scorch")) {
      return [
        l10n.leafScorchSymptom1,
        l10n.leafScorchSymptom2,
        l10n.leafScorchSymptom3,
      ];
    }

    return [getHealthySymptoms(name, l10n)];
  }

  List<String> getOrganicTreatment(
    String name,
    AppLocalizations l10n,
  ) {
    final value = name.toLowerCase();

    if (value.contains("apple") && value.contains("scab")) {
      return [
        l10n.appleScabOrganic1,
        l10n.appleScabOrganic2,
        l10n.appleScabOrganic3,
      ];
    }

    if (value.contains("apple") && value.contains("black rot")) {
      return [
        l10n.appleBlackRotOrganic1,
        l10n.appleBlackRotOrganic2,
        l10n.appleBlackRotOrganic3,
      ];
    }

    if (value.contains("cedar") && value.contains("rust")) {
      return [
        l10n.cedarAppleRustOrganic1,
        l10n.cedarAppleRustOrganic2,
      ];
    }

    if (value.contains("powdery mildew")) {
      return [
        l10n.powderyMildewOrganic1,
        l10n.powderyMildewOrganic2,
        l10n.powderyMildewOrganic3,
      ];
    }

    if (value.contains("gray leaf spot")) {
      return [
        l10n.grayLeafSpotOrganic1,
        l10n.grayLeafSpotOrganic2,
      ];
    }

    if (value.contains("common rust")) {
      return [
        l10n.commonRustOrganic1,
        l10n.commonRustOrganic2,
      ];
    }

    if (value.contains("northern leaf blight")) {
      return [
        l10n.northernLeafBlightOrganic1,
        l10n.northernLeafBlightOrganic2,
      ];
    }

    if (value.contains("grape") && value.contains("black rot")) {
      return [
        l10n.grapeBlackRotOrganic1,
        l10n.grapeBlackRotOrganic2,
      ];
    }

    if (value.contains("grape") && value.contains("esca")) {
      return [
        l10n.grapeEscaOrganic1,
        l10n.grapeEscaOrganic2,
      ];
    }

    if (value.contains("grape") && value.contains("leaf blight")) {
      return [
        l10n.grapeLeafBlightOrganic1,
        l10n.grapeLeafBlightOrganic2,
      ];
    }

    if (value.contains("potato") && value.contains("early blight")) {
      return [
        l10n.potatoEarlyBlightOrganic1,
        l10n.potatoEarlyBlightOrganic2,
      ];
    }

    if (value.contains("potato") && value.contains("late blight")) {
      return [
        l10n.potatoLateBlightOrganic1,
        l10n.potatoLateBlightOrganic2,
      ];
    }

    if (value.contains("tomato") && value.contains("early blight")) {
      return [
        l10n.tomatoEarlyBlightOrganic1,
        l10n.tomatoEarlyBlightOrganic2,
      ];
    }

    if (value.contains("tomato") && value.contains("late blight")) {
      return [
        l10n.tomatoLateBlightOrganic1,
        l10n.tomatoLateBlightOrganic2,
      ];
    }

    if (value.contains("bacterial spot")) {
      return [
        l10n.bacterialSpotOrganic1,
        l10n.bacterialSpotOrganic2,
      ];
    }

    if (value.contains("citrus greening")) {
      return [
        l10n.citrusGreeningOrganic1,
        l10n.citrusGreeningOrganic2,
      ];
    }

    if (value.contains("leaf scorch")) {
      return [
        l10n.leafScorchOrganic1,
        l10n.leafScorchOrganic2,
      ];
    }

    return [
      l10n.healthyOrganic,
    ];
  }

  List<String> getChemicalTreatment(
    String name,
    AppLocalizations l10n,
  ) {
    final value = name.toLowerCase();

    if (value.contains("apple") && value.contains("scab")) {
      return [
        l10n.appleScabChemical1,
        l10n.appleScabChemical2,
      ];
    }

    if (value.contains("apple") && value.contains("black rot")) {
      return [
        l10n.appleBlackRotChemical1,
        l10n.appleBlackRotChemical2,
      ];
    }

    if (value.contains("cedar") && value.contains("rust")) {
      return [
        l10n.cedarAppleRustChemical1,
      ];
    }

    if (value.contains("powdery mildew")) {
      return [
        l10n.powderyMildewChemical1,
        l10n.powderyMildewChemical2,
      ];
    }

    if (value.contains("gray leaf spot")) {
      return [
        l10n.grayLeafSpotChemical1,
        l10n.grayLeafSpotChemical2,
      ];
    }

    if (value.contains("common rust")) {
      return [
        l10n.commonRustChemical1,
      ];
    }

    if (value.contains("northern leaf blight")) {
      return [
        l10n.northernLeafBlightChemical1,
      ];
    }

    if (value.contains("grape") && value.contains("black rot")) {
      return [
        l10n.grapeBlackRotChemical1,
      ];
    }

    if (value.contains("grape") && value.contains("esca")) {
      return [
        l10n.grapeEscaChemical1,
      ];
    }

    if (value.contains("grape") && value.contains("leaf blight")) {
      return [
        l10n.grapeLeafBlightChemical1,
      ];
    }

    if (value.contains("potato") && value.contains("early blight")) {
      return [
        l10n.potatoEarlyBlightChemical1,
        l10n.potatoEarlyBlightChemical2,
      ];
    }

    if (value.contains("potato") && value.contains("late blight")) {
      return [
        l10n.potatoLateBlightChemical1,
        l10n.potatoLateBlightChemical2,
      ];
    }

    if (value.contains("tomato") && value.contains("early blight")) {
      return [
        l10n.tomatoEarlyBlightChemical1,
        l10n.tomatoEarlyBlightChemical2,
      ];
    }

    if (value.contains("tomato") && value.contains("late blight")) {
      return [
        l10n.tomatoLateBlightChemical1,
        l10n.tomatoLateBlightChemical2,
      ];
    }

    if (value.contains("bacterial spot")) {
      return [
        l10n.bacterialSpotChemical1,
      ];
    }

    if (value.contains("citrus greening")) {
      return [
        l10n.citrusGreeningChemical1,
      ];
    }

    if (value.contains("leaf scorch")) {
      return [
        l10n.leafScorchChemical1,
      ];
    }

    return [
      l10n.noChemicalTreatment,
    ];
  }

  List<String> getPrevention(
    String name,
    AppLocalizations l10n,
  ) {
    final value = name.toLowerCase();

    if (value.contains("apple") && value.contains("scab")) {
      return [
        l10n.appleScabPrevention1,
        l10n.appleScabPrevention2,
        l10n.appleScabPrevention3,
      ];
    }

    if (value.contains("apple") && value.contains("black rot")) {
      return [
        l10n.appleBlackRotPrevention1,
        l10n.appleBlackRotPrevention2,
        l10n.appleBlackRotPrevention3,
      ];
    }

    if (value.contains("cedar") && value.contains("rust")) {
      return [
        l10n.cedarAppleRustPrevention1,
        l10n.cedarAppleRustPrevention2,
      ];
    }

    if (value.contains("powdery mildew")) {
      return [
        l10n.powderyMildewPrevention1,
        l10n.powderyMildewPrevention2,
      ];
    }

    if (value.contains("gray leaf spot")) {
      return [
        l10n.grayLeafSpotPrevention1,
        l10n.grayLeafSpotPrevention2,
      ];
    }

    if (value.contains("common rust")) {
      return [
        l10n.commonRustPrevention1,
        l10n.commonRustPrevention2,
      ];
    }

    if (value.contains("northern leaf blight")) {
      return [
        l10n.northernLeafBlightPrevention1,
        l10n.northernLeafBlightPrevention2,
      ];
    }

    if (value.contains("grape") && value.contains("black rot")) {
      return [
        l10n.grapeBlackRotPrevention1,
        l10n.grapeBlackRotPrevention2,
      ];
    }

    if (value.contains("grape") && value.contains("esca")) {
      return [
        l10n.grapeEscaPrevention1,
        l10n.grapeEscaPrevention2,
      ];
    }

    if (value.contains("grape") && value.contains("leaf blight")) {
      return [
        l10n.grapeLeafBlightPrevention1,
        l10n.grapeLeafBlightPrevention2,
      ];
    }

    if (value.contains("potato") && value.contains("early blight")) {
      return [
        l10n.potatoEarlyBlightPrevention1,
        l10n.potatoEarlyBlightPrevention2,
      ];
    }

    if (value.contains("potato") && value.contains("late blight")) {
      return [
        l10n.potatoLateBlightPrevention1,
        l10n.potatoLateBlightPrevention2,
        l10n.potatoLateBlightPrevention3,
      ];
    }

    if (value.contains("tomato") && value.contains("early blight")) {
      return [
        l10n.tomatoEarlyBlightPrevention1,
        l10n.tomatoEarlyBlightPrevention2,
      ];
    }

    if (value.contains("tomato") && value.contains("late blight")) {
      return [
        l10n.tomatoLateBlightPrevention1,
        l10n.tomatoLateBlightPrevention2,
      ];
    }

    if (value.contains("bacterial spot")) {
      return [
        l10n.bacterialSpotPrevention1,
        l10n.bacterialSpotPrevention2,
      ];
    }

    if (value.contains("citrus greening")) {
      return [
        l10n.citrusGreeningPrevention1,
        l10n.citrusGreeningPrevention2,
      ];
    }

    if (value.contains("leaf scorch")) {
      return [
        l10n.leafScorchPrevention1,
        l10n.leafScorchPrevention2,
      ];
    }

    return [
      l10n.healthyPrevention,
    ];
  }

  bool isHealthy(String name) {
    return name.toLowerCase().contains("healthy");
  }

  Color confidenceColor(double confidence) {
    if (confidence >= 0.80) {
      return Colors.green;
    }

    if (confidence >= 0.50) {
      return Colors.orange;
    }

    return Colors.red;
  }

  String confidenceText(
    double confidence,
    AppLocalizations l10n,
  ) {
    if (confidence >= 0.80) {
      return l10n.highConfidence;
    }

    if (confidence >= 0.50) {
      return l10n.mediumConfidence;
    }

    return l10n.lowConfidenceStatus;
  }

  Widget infoCard({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: Colors.green,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }

  Widget bulletList(List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "• ",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 15,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Future<void> downloadPdf() async {
    try {
      await PdfService.createReport(
        widget.disease,
        widget.image,
        weather,
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("PDF report created successfully."),
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Unable to create PDF: $e"),
        ),
      );
    }
  }

  Future<void> sharePdf() async {
    try {
      await PdfService.generateReport(
        widget.disease,
        widget.image,
        weather,
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalizations.of(context)!.shareWindowOpened,
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "${AppLocalizations.of(context)!.unableToShare}: $e",
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final diseaseName = widget.disease.name;
    final healthy = isHealthy(diseaseName);

    final plantName = localizedPlantName(
      diseaseName,
      l10n,
    );

    final displayDisease = healthy
        ? l10n.healthyPlant
        : localizedDiseaseName(
            diseaseName,
            l10n,
          );

    final confidence = widget.disease.confidence;

    final cause = healthy
        ? getHealthyCause(diseaseName, l10n)
        : getCause(diseaseName, l10n);

    final symptoms = healthy
        ? [getHealthySymptoms(diseaseName, l10n)]
        : getSymptoms(diseaseName, l10n);

    final organic = getOrganicTreatment(
      diseaseName,
      l10n,
    );

    final chemical = getChemicalTreatment(
      diseaseName,
      l10n,
    );

    final prevention = getPrevention(
      diseaseName,
      l10n,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.detectionResult),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.file(
                  widget.image,
                  height: 240,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(height: 16),

            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    Icon(
                      healthy
                          ? Icons.check_circle
                          : Icons.warning_amber_rounded,
                      size: 55,
                      color: healthy
                          ? Colors.green
                          : Colors.orange,
                    ),

                    const SizedBox(height: 10),

                    Text(
                      healthy
                          ? l10n.healthyPlant
                          : l10n.diseaseDetected,
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: healthy
                            ? Colors.green
                            : Colors.orange,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 15),

                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "${l10n.plant}:",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            plantName,
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "${l10n.disease}:",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            displayDisease,
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    Text(
                      l10n.confidence,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 8),

                    LinearProgressIndicator(
                      value: confidence.clamp(0.0, 1.0),
                      minHeight: 10,
                      borderRadius: BorderRadius.circular(10),
                      color: confidenceColor(confidence),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      "${(confidence * 100).toStringAsFixed(1)}%",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: confidenceColor(confidence),
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      confidenceText(
                        confidence,
                        l10n,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 15),

            if (confidence < 0.50)
              Card(
                color: Colors.orange.shade50,
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.info_outline,
                        color: Colors.orange,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          l10n.lowConfidence,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            const SizedBox(height: 10),

            infoCard(
              title: l10n.cause,
              icon: Icons.info_outline,
              child: Text(
                cause,
                style: const TextStyle(
                  fontSize: 15,
                  height: 1.5,
                ),
              ),
            ),

            infoCard(
              title: l10n.symptoms,
              icon: Icons.sick_outlined,
              child: bulletList(symptoms),
            ),

            infoCard(
              title: l10n.organicTreatment,
              icon: Icons.eco_outlined,
              child: bulletList(organic),
            ),

            infoCard(
              title: l10n.chemicalTreatment,
              icon: Icons.science_outlined,
              child: bulletList(chemical),
            ),

            infoCard(
              title: l10n.prevention,
              icon: Icons.shield_outlined,
              child: bulletList(prevention),
            ),

            if (weatherLoading)
              infoCard(
                title: l10n.currentWeather,
                icon: Icons.cloud,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            else if (weather != null)
              infoCard(
                title: l10n.currentWeather,
                icon: Icons.cloud,
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${l10n.city}: ${weather!.city}",
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      "${l10n.temperature}: ${weather!.temperature.toStringAsFixed(1)}°C",
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      "${l10n.humidity}: ${weather!.humidity}%",
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      "${l10n.weather}: ${weather!.weather}",
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              )
            else
              infoCard(
                title: l10n.currentWeather,
                icon: Icons.cloud_off,
                child: Text(
                  l10n.unableWeather,
                ),
              ),

            infoCard(
              title: l10n.topPredictions,
              icon: Icons.analytics_outlined,
              child: Column(
                children: widget.disease.topPredictions
                    .map(
                      (prediction) => Padding(
                        padding:
                            const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                localizedDiseaseName(
                                  prediction.name,
                                  l10n,
                                ),
                              ),
                            ),
                            Text(
                              "${(prediction.confidence * 100).toStringAsFixed(1)}%",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),

            Card(
              color: Colors.red.shade50,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.warning_amber_rounded,
                          color: Colors.red,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            l10n.disclaimerTitle,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    Text(
                      l10n.disclaimerText,
                      style: const TextStyle(
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                onPressed: downloadPdf,
                icon: const Icon(Icons.picture_as_pdf),
                label: Text(l10n.downloadPdf),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                onPressed: sharePdf,
                icon: const Icon(Icons.share),
                label: Text(l10n.shareReport),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.refresh),
                label: Text(l10n.scanAgain),
              ),
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}