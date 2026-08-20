import 'package:flutter/material.dart';
import 'dart:math';
import '../l10n/app_localizations.dart';
import '../services/history_service.dart';
import '../widgets/statistics_chart.dart';
import 'scan_screen.dart';
import 'history_screen.dart';
import 'about_screen.dart';
import 'settings_screen.dart';
import 'expert_screen.dart';
import 'notes_screen.dart';
import 'farm_location_screen.dart';
import 'farm_location_screen.dart';
import 'feedback_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HistoryService historyService = HistoryService();

  int totalScans = 0;
  int healthyPlants = 0;
  int diseasedPlants = 0;

  final List<String> farmingTips = [
    "Inspect crop leaves regularly. Early disease detection improves yield.",
    "Water plants early in the morning to reduce evaporation.",
    "Remove infected leaves immediately to stop disease spread.",
    "Avoid overwatering because excess moisture promotes fungal diseases.",
    "Use healthy certified seeds for better crop production.",
    "Keep weeds under control to reduce pest attacks.",
    "Rotate crops every season to improve soil health.",
    "Apply fertilizers according to soil requirements.",
  ];

  String todayTip = "";

  @override
  void initState() {
    super.initState();

    todayTip = farmingTips[Random().nextInt(farmingTips.length)];

    loadScans();
  }

  Future<void> loadScans() async {
    final stats = await historyService.getStatistics();

    if (!mounted) return;

    setState(() {
      totalScans = stats["total"] ?? 0;
      healthyPlants = stats["healthy"] ?? 0;
      diseasedPlants = stats["diseased"] ?? 0;
    });
  }

  Widget buildStatCard({
    required BuildContext context,
    required IconData icon,
    required String value,
    required String title,
    required Color accentColor,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 18,
        ),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF202520) : Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: accentColor.withOpacity(0.20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(
                isDark ? 0.20 : 0.08,
              ),
              blurRadius: 12,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: accentColor.withOpacity(0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: accentColor,
                size: 28,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              value,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: isDark
                    ? Colors.white
                    : const Color(0xFF1B1B1B),
              ),
            ),

            const SizedBox(height: 4),

            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white70 : Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton({
    required BuildContext context,
    required IconData icon,
    required String title,
    required Color color,
    required Widget page,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => page,
              ),
            ).then((_) {
              loadScans();
            });
          },
          icon: Icon(
            icon,
            color: Colors.white,
          ),
          label: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final backgroundColor = isDark
        ? const Color(0xFF101510)
        : const Color(0xFFF5F8F5);

    final cardColor = isDark
        ? const Color(0xFF1C211D)
        : Colors.white;

    final primaryText = isDark
        ? Colors.white
        : const Color(0xFF172117);

    final secondaryText = isDark
        ? Colors.white70
        : Colors.black54;

    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: AppBar(
        title: Text(
          l10n.appTitle,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            letterSpacing: 0.3,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF4CAF50),
        foregroundColor: Colors.white,
        elevation: 0,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            16,
            18,
            16,
            30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              // Welcome Section
              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: isDark
                        ? const [
                            Color(0xFF18351D),
                            Color(0xFF24542C),
                          ]
                        : const [
                            Color(0xFFE8F5E9),
                            Color(0xFFF4FBF4),
                          ],
                  ),
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(
                    color: Colors.green.withOpacity(0.15),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.12),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.eco,
                        size: 58,
                        color: Colors.green,
                      ),
                    ),

                    const SizedBox(height: 14),

                    Text(
                      l10n.welcome,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: primaryText,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      "Detect crop diseases using Artificial Intelligence.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.4,
                        color: secondaryText,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              // Dashboard Title
              Text(
                "Your Crop Dashboard",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: primaryText,
                ),
              ),

              const SizedBox(height: 12),

              // Statistics Cards
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildStatCard(
                    context: context,
                    icon: Icons.analytics_outlined,
                    value: "$totalScans",
                    title: "Total Scans",
                    accentColor: Colors.blue,
                  ),

                  const SizedBox(width: 10),

                  buildStatCard(
                    context: context,
                    icon: Icons.eco_outlined,
                    value: "$healthyPlants",
                    title: "Healthy",
                    accentColor: Colors.green,
                  ),

                  const SizedBox(width: 10),

                  buildStatCard(
                    context: context,
                    icon: Icons.warning_amber_rounded,
                    value: "$diseasedPlants",
                    title: "Diseased",
                    accentColor: Colors.red,
                  ),
                ],
              ),

              const SizedBox(height: 22),

              // Plant Statistics
              Container(
                padding: const EdgeInsets.fromLTRB(
                  12,
                  18,
                  12,
                  12,
                ),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(
                        isDark ? 0.20 : 0.06,
                      ),
                      blurRadius: 12,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.bar_chart_rounded,
                            color: Colors.green,
                          ),
                        ),

                        const SizedBox(width: 10),

                        Text(
                          "Plant Statistics",
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: primaryText,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    StatisticsChart(
                      healthy: healthyPlants,
                      diseased: diseasedPlants,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              // Farming Tip
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: isDark
                      ? const Color(0xFF26321F)
                      : const Color(0xFFEAF6EC),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.green.withOpacity(0.15),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(9),
                          decoration: BoxDecoration(
                            color: Colors.orange.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.tips_and_updates,
                            color: Colors.orange,
                            size: 28,
                          ),
                        ),

                        const SizedBox(width: 10),

                        Expanded(
                          child: Text(
                            l10n.tip,
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: primaryText,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),

                    Text(
                      todayTip,
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.5,
                        color: secondaryText,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // Scan Crop
              buildButton(
                context: context,
                icon: Icons.camera_alt_rounded,
                title: l10n.scanCrop,
                color: Colors.green,
                page: const ScanScreen(),
              ),

              // History
              buildButton(
                context: context,
                icon: Icons.history_rounded,
                title: l10n.history,
                color: Colors.blue,
                page: const HistoryScreen(),
              ),

              // About
              buildButton(
                context: context,
                icon: Icons.info_outline_rounded,
                title: l10n.about,
                color: Colors.orange,
                page: const AboutScreen(),
              ),

              // Talk to Expert
              buildButton(
                context: context,
                icon: Icons.agriculture,
                title: l10n.talkToExpert,
                color: Colors.teal,
                page: const ExpertScreen(),
              ),
              // Notes & Calendar
              buildButton(
                context: context,
                icon: Icons.calendar_month_rounded,
                title: "Notes & Calendar",
                color: Colors.deepPurple,
                page: const NotesScreen(),
              ),
              // Farm / Plot Location
              buildButton(
                context: context,
                icon: Icons.location_on_rounded,
                title: "Farm / Plot Location",
                color: Colors.brown,
                page: const FarmLocationScreen(),
              ),
              // User Feedback
              buildButton(
                context: context,
                icon: Icons.feedback_outlined,
                title: "User Feedback",
                color: Colors.indigo,
                page: const FeedbackScreen(),
              ),    
              // Settings
              buildButton(
                context: context,
                icon: Icons.settings_outlined,
                title: l10n.settings,
                color: Colors.blueGrey,
                page: const SettingsScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}