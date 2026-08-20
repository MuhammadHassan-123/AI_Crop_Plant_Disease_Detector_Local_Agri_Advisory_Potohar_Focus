import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StatisticsChart extends StatelessWidget {
  final int healthy;
  final int diseased;

  const StatisticsChart({
    super.key,
    required this.healthy,
    required this.diseased,
  });

  @override
  Widget build(BuildContext context) {
    final total = healthy + diseased;

    if (total == 0) {
      return const Card(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Text(
              "No scan data available",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      );
    }

    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              "Plant Statistics",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              height: 220,
              child: PieChart(
                PieChartData(
                  sectionsSpace: 3,
                  centerSpaceRadius: 45,
                  sections: [
                    PieChartSectionData(
                      value: healthy.toDouble(),
                      color: Colors.green,
                      title: "$healthy",
                      radius: 70,
                      titleStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    PieChartSectionData(
                      value: diseased.toDouble(),
                      color: Colors.red,
                      title: "$diseased",
                      radius: 70,
                      titleStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Icon(Icons.circle, color: Colors.green, size: 14),
                    SizedBox(width: 5),
                    Text("Healthy"),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.circle, color: Colors.red, size: 14),
                    SizedBox(width: 5),
                    Text("Diseased"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}