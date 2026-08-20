import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/disease_model.dart';

class HistoryService {
  static const String historyKey = "scan_history";


  Future<void> saveScan(
    DiseaseModel disease,
    String imagePath,
  ) async {

    final prefs = await SharedPreferences.getInstance();


    List<String> history =
        prefs.getStringList(historyKey) ?? [];


    history.insert(
      0,
      jsonEncode({

        "name": disease.name,

        "confidence": disease.confidence,

        "remedy": disease.remedy,

        "image": imagePath,

        "time": DateTime.now().toString(),

      }),
    );


    await prefs.setStringList(
      historyKey,
      history,
    );
  }



  Future<List<Map<String, dynamic>>> getHistory() async {

    final prefs = await SharedPreferences.getInstance();


    List<String> history =
        prefs.getStringList(historyKey) ?? [];


    return history
        .map(
          (e) => jsonDecode(e)
              as Map<String, dynamic>,
        )
        .toList();
  }



  Future<void> clearHistory() async {

    final prefs = await SharedPreferences.getInstance();


    await prefs.remove(historyKey);

  }



  Future<void> deleteHistoryItem(int index) async {
    final prefs = await SharedPreferences.getInstance();

    List<String> history =
        prefs.getStringList(historyKey) ?? [];

    if (index >= 0 && index < history.length) {
      history.removeAt(index);

      await prefs.setStringList(
        historyKey,
        history,
      );
    }
  }

  Future<int> getTotalScans() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getStringList(historyKey)?.length ?? 0;
  }

  Future<Map<String, int>> getStatistics() async {
    final history = await getHistory();

    int healthy = 0;
    int diseased = 0;

    for (var item in history) {
      final name = item["name"].toString().toLowerCase();

      if (name.contains("healthy")) {
        healthy++;
      } else {
        diseased++;
      }
    }

    return {
      "total": history.length,
      "healthy": healthy,
      "diseased": diseased,
    };
  }
}