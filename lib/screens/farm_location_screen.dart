import 'dart:convert';

import '../l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geolocator/geolocator.dart';

class FarmLocationScreen extends StatefulWidget {
  const FarmLocationScreen({super.key});

  @override
  State<FarmLocationScreen> createState() =>
      _FarmLocationScreenState();
}

class _FarmLocationScreenState extends State<FarmLocationScreen> {
  final TextEditingController farmController =
      TextEditingController();

  final TextEditingController cropController =
      TextEditingController();

  final TextEditingController locationController =
      TextEditingController();

  final TextEditingController noteController =
      TextEditingController();

  List<Map<String, dynamic>> farms = [];

  bool isGettingLocation = false;

  @override
  void initState() {
    super.initState();
    loadFarms();
  }

  @override
  void dispose() {
    farmController.dispose();
    cropController.dispose();
    locationController.dispose();
    noteController.dispose();
    super.dispose();
  }

  Future<void> loadFarms() async {
    final prefs = await SharedPreferences.getInstance();

    final savedFarms = prefs.getString('farm_locations');

    if (savedFarms == null) return;

    final decoded = jsonDecode(savedFarms);

    if (!mounted) return;

    setState(() {
      farms = List<Map<String, dynamic>>.from(
        decoded.map(
          (farm) => Map<String, dynamic>.from(farm),
        ),
      );
    });
  }

  Future<void> saveFarms() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      'farm_locations',
      jsonEncode(farms),
    );
  }

  Future<void> getCurrentLocation() async {
    setState(() {
      isGettingLocation = true;
    });

    try {
      bool serviceEnabled =
          await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        if (!mounted) return;

        final l10n = AppLocalizations.of(context)!;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.turnOnLocation),
          ),
        );

        setState(() {
          isGettingLocation = false;
        });

        return;
      }

      LocationPermission permission =
          await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission =
            await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.denied) {
        if (!mounted) return;

        final l10n = AppLocalizations.of(context)!;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.locationPermissionDenied),
          ),
        );

        setState(() {
          isGettingLocation = false;
        });

        return;
      }

      if (permission == LocationPermission.deniedForever) {
        if (!mounted) return;

        final l10n = AppLocalizations.of(context)!;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              l10n.locationPermissionDeniedForever,
            ),
          ),
        );

        setState(() {
          isGettingLocation = false;
        });

        return;
      }

      final position =
          await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );

      if (!mounted) return;

      final l10n = AppLocalizations.of(context)!;

      locationController.text =
          '${position.latitude.toStringAsFixed(6)}, '
          '${position.longitude.toStringAsFixed(6)}';

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            l10n.currentLocationDetected,
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;

      final l10n = AppLocalizations.of(context)!;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '${l10n.unableToGetLocation}: $e',
          ),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          isGettingLocation = false;
        });
      }
    }
  }

  Future<void> addFarm() async {
    final l10n = AppLocalizations.of(context)!;

    final farmName = farmController.text.trim();
    final cropName = cropController.text.trim();
    final location = locationController.text.trim();
    final note = noteController.text.trim();

    if (farmName.isEmpty ||
        cropName.isEmpty ||
        location.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '${l10n.farmPlotName}, ${l10n.crop} ${l10n.location.toLowerCase()} ${l10n.pleaseEnterNote}',
          ),
        ),
      );

      return;
    }

    final now = DateTime.now();

    setState(() {
      farms.insert(
        0,
        {
          'farmName': farmName,
          'crop': cropName,
          'location': location,
          'note': note,
          'date':
              '${now.day}/${now.month}/${now.year}',
        },
      );
    });

    await saveFarms();

    farmController.clear();
    cropController.clear();
    locationController.clear();
    noteController.clear();

    if (!mounted) return;

    Navigator.pop(context);
  }

  Future<void> deleteFarm(int index) async {
    setState(() {
      farms.removeAt(index);
    });

    await saveFarms();
  }

  void showAddFarmDialog() {
    farmController.clear();
    cropController.clear();
    locationController.clear();
    noteController.clear();

    showDialog(
      context: context,
      builder: (dialogContext) {
        final l10n = AppLocalizations.of(context)!;

        return AlertDialog(
          title: Text(
            l10n.addFarmPlot,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: farmController,
                  decoration: InputDecoration(
                    labelText: l10n.farmPlotName,
                    hintText: l10n.mainFarm,
                    prefixIcon:
                        const Icon(Icons.agriculture),
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                TextField(
                  controller: cropController,
                  decoration: InputDecoration(
                    labelText: l10n.crop,
                    hintText: l10n.potatoExample,
                    prefixIcon:
                        const Icon(Icons.grass),
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                TextField(
                  controller: locationController,
                  decoration: InputDecoration(
                    labelText: l10n.location,
                    hintText:
                        l10n.islamabadPakistan,
                    prefixIcon:
                        const Icon(Icons.location_on),
                    suffixIcon: isGettingLocation
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: Padding(
                              padding:
                                  EdgeInsets.all(12),
                              child:
                                  CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            ),
                          )
                        : IconButton(
                            onPressed:
                                getCurrentLocation,
                            icon: const Icon(
                              Icons.my_location,
                              color: Colors.green,
                            ),
                            tooltip:
                                l10n.useCurrentLocation,
                          ),
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                TextField(
                  controller: noteController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: l10n.optionalNote,
                    hintText:
                        l10n.plotInformation,
                    prefixIcon:
                        const Icon(Icons.notes),
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(12),
                    ),
                  ),
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
              onPressed: addFarm,
              icon: const Icon(Icons.save),
              label: Text(l10n.save),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final isDark =
        Theme.of(context).brightness ==
            Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.farmPlotLocations,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),

      floatingActionButton:
          FloatingActionButton.extended(
        onPressed: showAddFarmDialog,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        icon: const Icon(
          Icons.add_location_alt,
        ),
        label: Text(l10n.addFarm),
      ),

      body: farms.isEmpty
          ? Center(
              child: Padding(
                padding:
                    const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 80,
                      color: isDark
                          ? Colors.white38
                          : Colors.grey,
                    ),

                    const SizedBox(height: 16),

                    Text(
                      l10n.noFarmPlotAdded,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight:
                            FontWeight.bold,
                        color: isDark
                            ? Colors.white
                            : Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      l10n.organizeCropInformation,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: isDark
                            ? Colors.white70
                            : Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : ListView.builder(
              padding:
                  const EdgeInsets.all(16),
              itemCount: farms.length,
              itemBuilder:
                  (context, index) {
                final farm = farms[index];

                return Card(
                  margin:
                      const EdgeInsets.only(
                    bottom: 14,
                  ),
                  elevation: 2,
                  shape:
                      RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(
                      18,
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets
                                      .all(10),
                              decoration:
                                  BoxDecoration(
                                color: Colors.green
                                    .withOpacity(
                                  0.12,
                                ),
                                borderRadius:
                                    BorderRadius
                                        .circular(
                                  12,
                                ),
                              ),
                              child: const Icon(
                                Icons.agriculture,
                                color:
                                    Colors.green,
                              ),
                            ),

                            const SizedBox(
                              width: 12,
                            ),

                            Expanded(
                              child: Text(
                                farm['farmName'] ??
                                    '',
                                style:
                                    const TextStyle(
                                  fontSize: 18,
                                  fontWeight:
                                      FontWeight
                                          .bold,
                                ),
                              ),
                            ),

                            IconButton(
                              onPressed: () {
                                deleteFarm(
                                  index,
                                );
                              },
                              icon: const Icon(
                                Icons
                                    .delete_outline,
                                color:
                                    Colors.red,
                              ),
                            ),
                          ],
                        ),

                        const Divider(
                          height: 24,
                        ),

                        Row(
                          children: [
                            const Icon(
                              Icons.grass,
                              size: 20,
                              color:
                                  Colors.green,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Text(
                                '${l10n.cropLabel}: ${farm['crop'] ?? ''}',
                                style:
                                    const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 10,
                        ),

                        Row(
                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 20,
                              color: Colors.red,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Text(
                                '${l10n.locationLabel}: ${farm['location'] ?? ''}',
                                style:
                                    const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),

                        if ((farm['note'] ?? '')
                            .toString()
                            .isNotEmpty) ...[
                          const SizedBox(
                            height: 10,
                          ),

                          Row(
                            crossAxisAlignment:
                                CrossAxisAlignment
                                    .start,
                            children: [
                              const Icon(
                                Icons.notes,
                                size: 20,
                                color:
                                    Colors.orange,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Text(
                                  '${l10n.noteLabel}: ${farm['note']}',
                                  style:
                                      const TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],

                        const SizedBox(
                          height: 12,
                        ),

                        Text(
                          '${l10n.added}: ${farm['date'] ?? ''}',
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
                );
              },
            ),
    );
  }
}