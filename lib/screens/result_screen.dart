import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String diseaseName;
  final double confidence;
  final String remedy;

  const ResultScreen({
    super.key,
    required this.diseaseName,
    required this.confidence,
    required this.remedy,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detection Result"),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            const Icon(
              Icons.eco,
              size: 90,
              color: Colors.green,
            ),

            const SizedBox(height: 20),

            const Text(
              "Disease Detected",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [

                    Text(
                      diseaseName,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Text(
                      "Confidence: ${(confidence * 100).toStringAsFixed(1)}%",
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),

                    const SizedBox(height: 25),

                    const Text(
                      "Recommended Remedy",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      remedy,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),

            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 55),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.camera_alt),
              label: const Text(
                "Scan Again",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}