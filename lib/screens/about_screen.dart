import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Text(
          "AI Crop Disease Detector\n\nThis application helps farmers detect crop diseases using Artificial Intelligence.",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}