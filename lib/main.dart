import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const CropDiseaseApp());
}

class CropDiseaseApp extends StatelessWidget {
  const CropDiseaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'AI Crop Disease Detector',

      theme: ThemeData(
        primarySwatch: Colors.green,
      ),

      home: const SplashScreen(),
    );
  }
}