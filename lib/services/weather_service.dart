import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather_model.dart';

class WeatherService {
  static const String apiKey = "20bc023e2ce7ce4409a25794b12abd71";

  Future<WeatherModel> getWeather(String city) async {
    final url = Uri.parse(
      "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric",
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception("Failed to load weather");
    }
  }
}