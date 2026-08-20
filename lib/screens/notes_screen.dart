import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../l10n/app_localizations.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final TextEditingController noteController =
      TextEditingController();

  List<Map<String, dynamic>> notes = [];

  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    loadNotes();
  }

  @override
  void dispose() {
    noteController.dispose();
    super.dispose();
  }

  Future<void> loadNotes() async {
    final prefs = await SharedPreferences.getInstance();

    final savedNotes = prefs.getString('crop_notes');

    if (savedNotes == null) return;

    final decoded = jsonDecode(savedNotes);

    if (!mounted) return;

    setState(() {
      notes = List<Map<String, dynamic>>.from(
        decoded.map(
          (note) => Map<String, dynamic>.from(note),
        ),
      );
    });
  }

  Future<void> saveNotes() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      'crop_notes',
      jsonEncode(notes),
    );
  }

  Future<void> addNote() async {
    final l10n = AppLocalizations.of(context)!;
    final text = noteController.text.trim();

    if (text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.pleaseEnterNote),
        ),
      );
      return;
    }

    final now = DateTime.now();

    setState(() {
      notes.insert(
        0,
        {
          'text': text,
          'date':
              '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
          'time':
              '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}',
        },
      );
    });

    await saveNotes();

    noteController.clear();

    if (!mounted) return;

    Navigator.pop(context);
  }

  Future<void> deleteNote(int index) async {
    setState(() {
      notes.removeAt(index);
    });

    await saveNotes();
  }

  void showAddNoteDialog() {
    final l10n = AppLocalizations.of(context)!;

    noteController.clear();
    selectedDate = DateTime.now();

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(
            l10n.addCropNote,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: noteController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: l10n.writeCropNote,
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                Row(
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      color: Colors.green,
                    ),

                    const SizedBox(width: 8),

                    Expanded(
                      child: Text(
                        '${l10n.date}: ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    TextButton(
                      onPressed: () async {
                        final date =
                            await showDatePicker(
                          context: dialogContext,
                          initialDate: selectedDate,
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2100),
                        );

                        if (date != null) {
                          setState(() {
                            selectedDate = date;
                          });
                        }
                      },
                      child: Text(l10n.change),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: Text(l10n.cancel),
            ),

            ElevatedButton.icon(
              onPressed: addNote,
              icon: const Icon(Icons.save),
              label: Text(l10n.save),
            ),
          ],
        );
      },
    );
  }

  Widget buildCalendar() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: CalendarDatePicker(
          initialDate: selectedDate,
          firstDate: DateTime(2020),
          lastDate: DateTime(2100),
          onDateChanged: (date) {
            setState(() {
              selectedDate = date;
            });
          },
        ),
      ),
    );
  }

  Widget buildNoteCard(
    BuildContext context,
    Map<String, dynamic> note,
    int index,
  ) {
    final l10n = AppLocalizations.of(context)!;

    final isDark =
        Theme.of(context).brightness ==
            Brightness.dark;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color:
                    Colors.green.withOpacity(0.12),
                borderRadius:
                    BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.event_note,
                color: Colors.green,
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    note['text'] ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight:
                          FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    '${note['date']}  •  ${note['time']}',
                    style: TextStyle(
                      fontSize: 12,
                      color: isDark
                          ? Colors.white60
                          : Colors.black54,
                    ),
                  ),
                ],
              ),
            ),

            IconButton(
              icon: const Icon(
                Icons.delete_outline,
                color: Colors.red,
              ),
              tooltip: l10n.delete,
              onPressed: () {
                deleteNote(index);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final isDark =
        Theme.of(context).brightness ==
            Brightness.dark;

    final selectedDateString =
        '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';

    final selectedDateNotes = notes
        .asMap()
        .entries
        .where(
          (entry) =>
              entry.value['date'] ==
              selectedDateString,
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.notesCalendar,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),

      floatingActionButton:
          FloatingActionButton.extended(
        onPressed: showAddNoteDialog,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: Text(l10n.addNote),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.stretch,
          children: [
            Text(
              l10n.cropCalendar,
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            buildCalendar(),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isDark
                    ? const Color(0xFF26321F)
                    : const Color(0xFFEAF6EC),
                borderRadius:
                    BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.event,
                    color: Colors.green,
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: Text(
                      '${l10n.selectedDate}: $selectedDateString',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight:
                            FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Text(
              l10n.notesForSelectedDate,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: isDark
                    ? Colors.white
                    : Colors.black87,
              ),
            ),

            const SizedBox(height: 12),

            if (selectedDateNotes.isEmpty)
              Container(
                padding:
                    const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: isDark
                      ? const Color(0xFF1C211D)
                      : Colors.grey.shade100,
                  borderRadius:
                      BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.note_alt_outlined,
                      size: 50,
                      color: isDark
                          ? Colors.white38
                          : Colors.grey,
                    ),

                    const SizedBox(height: 10),

                    Text(
                      l10n.noNotesForDate,
                      textAlign:
                          TextAlign.center,
                    ),
                  ],
                ),
              )
            else
              ...selectedDateNotes.map(
                (entry) => buildNoteCard(
                  context,
                  entry.value,
                  entry.key,
                ),
              ),

            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}