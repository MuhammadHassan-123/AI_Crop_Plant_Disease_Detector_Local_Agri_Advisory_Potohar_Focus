import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
import '../providers/locale_provider.dart';
import '../l10n/app_localizations.dart';
import '../services/history_service.dart';
import 'about_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notifications = true;

  final HistoryService historyService = HistoryService();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final localeProvider = Provider.of<LocaleProvider>(context);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settings),
        centerTitle: true,
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            // =========================
            // NOTIFICATIONS + DARK MODE
            // =========================
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),

              child: Column(
                children: [

                  // NOTIFICATIONS
                  SwitchListTile(
                    secondary: const Icon(
                      Icons.notifications,
                      color: Colors.orange,
                    ),

                    title: Text(
                      l10n.notifications,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    subtitle: Text(
                      l10n.notificationSubtitle,
                    ),

                    value: notifications,

                    onChanged: (value) {
                      setState(() {
                        notifications = value;
                      });
                    },
                  ),

                  const Divider(),

                  // DARK MODE
                  SwitchListTile(
                    secondary: const Icon(
                      Icons.dark_mode,
                      color: Colors.orange,
                    ),

                    title: Text(
                      l10n.darkMode,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    subtitle: Text(
                      l10n.darkModeSubtitle,
                    ),

                    value: themeProvider.isDark,

                    onChanged: (value) {
                      themeProvider.toggleTheme(value);
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // =========================
            // CLEAR HISTORY + LANGUAGE
            // =========================
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),

              child: Column(
                children: [

                  // CLEAR HISTORY
                  ListTile(
                    leading: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),

                    title: Text(
                      l10n.clearHistory,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    subtitle: Text(
                      l10n.clearHistorySubtitle,
                    ),

                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    ),

                    onTap: () async {
                      final shouldClear = await showDialog<bool>(
                        context: context,

                        builder: (dialogContext) {
                          return AlertDialog(
                            title: Text(
                              l10n.clearHistory,
                            ),

                            content: Text(
                              l10n.clearHistoryConfirmation,
                            ),

                            actions: [

                              TextButton(
                                onPressed: () {
                                  Navigator.pop(
                                    dialogContext,
                                    false,
                                  );
                                },

                                child: Text(
                                  l10n.cancel,
                                ),
                              ),

                              TextButton(
                                onPressed: () {
                                  Navigator.pop(
                                    dialogContext,
                                    true,
                                  );
                                },

                                child: Text(
                                  l10n.clear,
                                  style: const TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );

                      if (shouldClear == true) {
                        await historyService.clearHistory();

                        if (!mounted) return;

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              l10n.historyClearedSuccessfully,
                            ),
                          ),
                        );

                        setState(() {});
                      }
                    },
                  ),

                  const Divider(),

                  // LANGUAGE
                  ListTile(
                    leading: const Icon(
                      Icons.language,
                      color: Colors.green,
                    ),

                    title: Text(
                      l10n.language,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    subtitle: Text(
                      localeProvider.locale.languageCode == 'en'
                          ? l10n.english
                          : l10n.urdu,
                    ),

                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    ),

                    onTap: () {
                      showDialog(
                        context: context,

                        builder: (dialogContext) {
                          return AlertDialog(
                            title: Text(
                              l10n.selectLanguage,
                            ),

                            content: Column(
                              mainAxisSize: MainAxisSize.min,

                              children: [

                                // ENGLISH
                                ListTile(
                                  title: Text(
                                    l10n.english,
                                  ),

                                  onTap: () {
                                    localeProvider.changeLanguage(
                                      const Locale('en'),
                                    );

                                    Navigator.pop(
                                      dialogContext,
                                    );
                                  },
                                ),

                                // URDU
                                ListTile(
                                  title: Text(
                                    l10n.urdu,
                                  ),

                                  onTap: () {
                                    localeProvider.changeLanguage(
                                      const Locale('ur'),
                                    );

                                    Navigator.pop(
                                      dialogContext,
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // =========================
            // ABOUT APP
            // =========================
            Card(
              elevation: 4,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),

              child: ListTile(
                leading: const Icon(
                  Icons.info,
                  color: Colors.blue,
                ),

                title: Text(
                  l10n.aboutApp,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                subtitle: Text(
                  l10n.appTitle,
                ),

                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),

                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AboutScreen(),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),

            // =========================
            // FOOTER
            // =========================
            Text(
              "${l10n.appTitle}\n${l10n.qauInternship}",

              textAlign: TextAlign.center,

              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}