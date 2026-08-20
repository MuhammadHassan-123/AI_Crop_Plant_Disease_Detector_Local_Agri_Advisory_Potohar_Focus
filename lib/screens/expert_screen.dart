import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../l10n/app_localizations.dart';

class ExpertScreen extends StatelessWidget {
  const ExpertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.talkToExpert),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            // Expert Header
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: Colors.teal.withOpacity(0.10),
                borderRadius: BorderRadius.circular(20),
              ),

              child: Column(
                children: [

                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: Colors.teal,
                      shape: BoxShape.circle,
                    ),

                    child: const Icon(
                      Icons.agriculture,
                      color: Colors.white,
                      size: 45,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Text(
                    l10n.talkToAgriculturalExpert,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    l10n.expertDescription,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 15,
                      height: 1.4,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Important Note
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),

              child: Padding(
                padding: const EdgeInsets.all(18),

                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Icon(
                      Icons.info_outline,
                      color: Colors.orange,
                      size: 28,
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: Text(
                        l10n.disclaimerText,
                        style: const TextStyle(
                          fontSize: 14,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Contact Expert
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),

              child: Padding(
                padding: const EdgeInsets.all(18),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      l10n.contactExpert,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    // Agricultural Helpline
                    ListTile(
                      contentPadding: EdgeInsets.zero,

                      leading: const CircleAvatar(
                        backgroundColor: Colors.teal,
                        child: Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                      ),

                      title: Text(
                        l10n.agriculturalHelpline,
                      ),

                      subtitle: Text(
                        l10n.localAgricultureExpert,
                      ),

                      onTap: () async {
                        final Uri phoneUri = Uri(
                          scheme: 'tel',
                          path: '0800-17000',
                        );

                        if (await canLaunchUrl(phoneUri)) {
                          await launchUrl(phoneUri);
                        } else {
                          if (!context.mounted) return;

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                l10n.unableToOpenPhone,
                              ),
                            ),
                          );
                        }
                      },
                    ),

                    const Divider(),

                    // Email Consultation
                    ListTile(
                      contentPadding: EdgeInsets.zero,

                      leading: const CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                      ),

                      title: Text(
                        l10n.emailConsultation,
                      ),

                      subtitle: Text(
                        l10n.sendCropQuestion,
                      ),

                      onTap: () async {
                        final Uri emailUri = Uri(
                          scheme: 'mailto',
                          path: 'agriculture@example.com',
                          queryParameters: {
                            'subject': l10n.emailSubject,
                            'body': l10n.emailBody,
                          },
                        );

                        if (await canLaunchUrl(emailUri)) {
                          await launchUrl(emailUri);
                        } else {
                          if (!context.mounted) return;

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                l10n.unableToOpenEmail,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Ask Question
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),

              child: Padding(
                padding: const EdgeInsets.all(18),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      l10n.askQuestion,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    TextField(
                      maxLines: 5,

                      decoration: InputDecoration(
                        hintText: l10n.describeCropProblem,

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),

                        prefixIcon: const Padding(
                          padding: EdgeInsets.only(bottom: 75),
                          child: Icon(Icons.edit_note),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    SizedBox(
                      width: double.infinity,
                      height: 52,

                      child: ElevatedButton.icon(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                l10n.questionReady,
                              ),
                            ),
                          );
                        },

                        icon: const Icon(Icons.send),

                        label: Text(
                          l10n.submitQuestion,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          foregroundColor: Colors.white,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Reminder
            Container(
              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.08),

                borderRadius: BorderRadius.circular(15),

                border: Border.all(
                  color: Colors.green.withOpacity(0.15),
                ),
              ),

              child: Text(
                l10n.expertTip,
                textAlign: TextAlign.center,

                style: const TextStyle(
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}