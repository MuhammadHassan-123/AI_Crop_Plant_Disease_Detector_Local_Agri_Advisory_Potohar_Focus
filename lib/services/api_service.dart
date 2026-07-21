import 'dart:io';

import 'package:google_generative_ai/google_generative_ai.dart';

class ApiService {
  // 👇 Apni Gemini API Key yahan paste karo
  static const String apiKey = "static const String apiKey = "";";

  Future<Map<String, dynamic>> detectDisease(File imageFile) async {
    try {
      final model = GenerativeModel(
        model: 'gemini-1.5-flash',
        apiKey: apiKey,
      );

      final imageBytes = await imageFile.readAsBytes();

      final prompt = TextPart("""
You are an expert agricultural plant pathologist.

Analyze the uploaded crop leaf image.

Return ONLY in this format:

Disease: <Disease Name>

Confidence: <0-100>

Remedy: <Short Remedy>

If the leaf is healthy, write:

Disease: Healthy Leaf
Confidence: 99
Remedy: The crop appears healthy. Continue proper irrigation and fertilizer schedule.

Do not write anything else.
""");

      final imagePart = DataPart(
        "image/jpeg",
        imageBytes,
      );

      final response = await model.generateContent([
        Content.multi([
          prompt,
          imagePart,
        ])
      ]);

      final text = response.text ?? "";

      String disease = "Unknown";
      double confidence = 0.0;
      String remedy = "No remedy found.";

      final lines = text.split("\n");

      for (final line in lines) {
        if (line.toLowerCase().startsWith("disease:")) {
          disease = line.replaceFirst(RegExp(r'Disease:\s*', caseSensitive: false), "").trim();
        }

        if (line.toLowerCase().startsWith("confidence:")) {
          final value = line
              .replaceFirst(RegExp(r'Confidence:\s*', caseSensitive: false), "")
              .replaceAll("%", "")
              .trim();

          confidence = (double.tryParse(value) ?? 0) / 100;
        }

        if (line.toLowerCase().startsWith("remedy:")) {
          remedy = line.replaceFirst(RegExp(r'Remedy:\s*', caseSensitive: false), "").trim();
        }
      }

      return {
        "name": disease,
        "confidence": confidence,
        "remedy": remedy,
      };
    } catch (e) {
      return {
        "name": "API Error",
        "confidence": 0.0,
        "remedy": e.toString(),
      };
    }
  }
}