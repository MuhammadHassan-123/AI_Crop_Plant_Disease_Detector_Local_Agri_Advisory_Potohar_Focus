class DiseaseModel {
  final String name;
  final double confidence;
  final String confidenceStatus;
  final String remedy;
  final List<TopPrediction> topPredictions;

  DiseaseModel({
    required this.name,
    required this.confidence,
    required this.confidenceStatus,
    required this.remedy,
    required this.topPredictions,
  });

  factory DiseaseModel.fromJson(Map<String, dynamic> json) {
    return DiseaseModel(
      name: json["name"] ?? "Unknown",
      confidence: (json["confidence"] ?? 0.0).toDouble(),
      confidenceStatus:
          json["confidence_status"] ?? "Unknown",
      remedy:
          json["remedy"] ?? "No remedy available",
      topPredictions:
          (json["top_predictions"] as List?)
                  ?.map(
                    (e) => TopPrediction.fromJson(e),
                  )
                  .toList() ??
              [],
    );
  }
}

class TopPrediction {
  final String name;
  final double confidence;

  TopPrediction({
    required this.name,
    required this.confidence,
  });

  factory TopPrediction.fromJson(
      Map<String, dynamic> json) {
    return TopPrediction(
      name: json["name"] ?? "Unknown",
      confidence:
          (json["confidence"] ?? 0.0).toDouble(),
    );
  }
}