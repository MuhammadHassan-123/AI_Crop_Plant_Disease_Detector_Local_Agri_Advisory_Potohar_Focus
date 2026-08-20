import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  double easeRating = 0;
  double resultRating = 0;
  double remedyRating = 0;
  double scanRating = 0;

  String selectedFeature = '';

  final TextEditingController suggestionController =
      TextEditingController();

  @override
  void dispose() {
    suggestionController.dispose();
    super.dispose();
  }

  Future<void> submitFeedback() async {
    final l10n = AppLocalizations.of(context)!;

    if (easeRating == 0 ||
        resultRating == 0 ||
        remedyRating == 0 ||
        scanRating == 0 ||
        selectedFeature.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            l10n.completeFeedback,
          ),
        ),
      );
      return;
    }

    final prefs = await SharedPreferences.getInstance();

    final feedback = {
      'easeRating': easeRating,
      'resultRating': resultRating,
      'remedyRating': remedyRating,
      'scanRating': scanRating,
      'feature': selectedFeature,
      'suggestion': suggestionController.text.trim(),
      'date': DateTime.now().toIso8601String(),
    };

    final oldFeedback =
        prefs.getStringList('user_feedback') ?? [];

    oldFeedback.add(jsonEncode(feedback));

    await prefs.setStringList(
      'user_feedback',
      oldFeedback,
    );

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          l10n.feedbackSaved,
        ),
      ),
    );

    Navigator.pop(context);
  }

  Widget buildRatingSection({
    required String title,
    required double rating,
    required ValueChanged<double> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: List.generate(
            5,
            (index) {
              final starNumber = index + 1;

              return IconButton(
                onPressed: () {
                  onChanged(starNumber.toDouble());
                },
                icon: Icon(
                  starNumber <= rating
                      ? Icons.star
                      : Icons.star_border,
                  color: Colors.amber,
                  size: 32,
                ),
              );
            },
          ),
        ),
        const Divider(height: 20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    final features = [
      l10n.diseaseDetection,
      l10n.remedy,
      l10n.weather,
      l10n.history,
      l10n.notesCalendar,
      l10n.farmLocation,
      l10n.talkToExpert,
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.feedbackTitle,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: isDark
                    ? const Color(0xFF1C2A1E)
                    : const Color(0xFFE8F5E9),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.feedback_outlined,
                    size: 50,
                    color: Colors.green,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    l10n.helpUsImprove,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    l10n.shareExperience,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            buildRatingSection(
              title: l10n.appEasyToUse,
              rating: easeRating,
              onChanged: (value) {
                setState(() {
                  easeRating = value;
                });
              },
            ),

            buildRatingSection(
              title: l10n.resultEasyToUnderstand,
              rating: resultRating,
              onChanged: (value) {
                setState(() {
                  resultRating = value;
                });
              },
            ),

            buildRatingSection(
              title: l10n.remediesUseful,
              rating: remedyRating,
              onChanged: (value) {
                setState(() {
                  remedyRating = value;
                });
              },
            ),

            buildRatingSection(
              title: l10n.scanningUseful,
              rating: scanRating,
              onChanged: (value) {
                setState(() {
                  scanRating = value;
                });
              },
            ),

            const SizedBox(height: 10),

            Text(
              l10n.mostUsefulFeature,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 10),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: features.map(
                (feature) {
                  return ChoiceChip(
                    label: Text(feature),
                    selected:
                        selectedFeature == feature,
                    onSelected: (selected) {
                      setState(() {
                        selectedFeature =
                            selected ? feature : '';
                      });
                    },
                  );
                },
              ).toList(),
            ),

            const SizedBox(height: 24),

            Text(
              l10n.anyProblemSuggestion,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: suggestionController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: l10n.writeFeedback,
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(14),
                ),
              ),
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton.icon(
                onPressed: submitFeedback,
                icon: const Icon(Icons.send),
                label: Text(
                  l10n.submitFeedback,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(14),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}