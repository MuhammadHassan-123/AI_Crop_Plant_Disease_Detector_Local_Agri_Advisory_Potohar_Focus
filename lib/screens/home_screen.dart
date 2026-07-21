import 'package:flutter/material.dart';
import 'scan_screen.dart';
import 'history_screen.dart';
import 'about_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget buildButton({
    required BuildContext context,
    required IconData icon,
    required String title,
    required Color color,
    required Widget page,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page),
            );
          },
          icon: Icon(icon, color: Colors.white),
          label: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AI Crop Disease Detector"),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 20),

                const Icon(
                  Icons.eco,
                  size: 100,
                  color: Colors.green,
                ),

                const SizedBox(height: 20),

                const Text(
                  "Welcome to Smart Farming",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Detect crop diseases using Artificial Intelligence.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),

                const SizedBox(height: 40),

                buildButton(
                  context: context,
                  icon: Icons.camera_alt,
                  title: "Scan Crop",
                  color: Colors.green,
                  page: const ScanScreen(),
                ),

                buildButton(
                  context: context,
                  icon: Icons.history,
                  title: "History",
                  color: Colors.blue,
                  page: const HistoryScreen(),
                ),

                buildButton(
                  context: context,
                  icon: Icons.info,
                  title: "About",
                  color: Colors.orange,
                  page: const AboutScreen(),
                ),

                buildButton(
                  context: context,
                  icon: Icons.settings,
                  title: "Settings",
                  color: Colors.grey,
                  page: const SettingsScreen(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}