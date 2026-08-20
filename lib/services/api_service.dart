import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/disease_model.dart';

class ApiService {
  // Windows/Desktop
  static const String baseUrl = "http://127.0.0.1:8000";

  // Android Emulator:
  // static const String baseUrl = "http://10.0.2.2:8000";

  Future<DiseaseModel> detectDisease(File imageFile) async {
    try {
      var request = http.MultipartRequest(
        "POST",
        Uri.parse("$baseUrl/predict"),
      );

      request.files.add(
        await http.MultipartFile.fromPath(
          "file",
          imageFile.path,
        ),
      );

      print("Uploading image...");
      print("Path: ${imageFile.path}");

      var streamedResponse = await request
          .send()
          .timeout(const Duration(seconds: 60));

      var response =
          await http.Response.fromStream(streamedResponse);

      print("Backend Status: ${response.statusCode}");
      print("Response: ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        return DiseaseModel.fromJson(data);
      } else {
        return DiseaseModel(
          name: "Server Error",
          confidence: 0.0,
          confidenceStatus: "Server Error",
          remedy:
              "Backend returned status ${response.statusCode}",
          topPredictions: [],
        );
      }
    } catch (e) {
      print("API Error: $e");

      return DiseaseModel(
        name: "Connection Error",
        confidence: 0.0,
        confidenceStatus: "Connection Failed",
        remedy: e.toString(),
        topPredictions: [],
      );
    }
  }
}