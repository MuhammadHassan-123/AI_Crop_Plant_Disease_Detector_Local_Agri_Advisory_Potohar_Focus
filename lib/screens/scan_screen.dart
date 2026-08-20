import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../l10n/app_localizations.dart';
import '../models/disease_model.dart';
import '../services/api_service.dart';
import '../services/history_service.dart';
import 'result_screen.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  final ImagePicker _picker = ImagePicker();
  final ApiService apiService = ApiService();
  final HistoryService historyService = HistoryService();

  File? _image;
  bool _loading = false;


  Future<void> pickCamera() async {
    final XFile? file = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
    );

    if (file != null) {
      setState(() {
        _image = File(file.path);
      });
    }
  }


  Future<void> pickGallery() async {
    final XFile? file = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (file != null) {
      setState(() {
        _image = File(file.path);
      });
    }
  }


  void showLoadingDialog() {
    final l10n = AppLocalizations.of(context)!;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              const CircularProgressIndicator(),

              const SizedBox(height: 20),

              Text(
                l10n.aiAnalyzing,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                l10n.pleaseWait,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }


  Future<void> showSuccessDialog() async {
    final l10n = AppLocalizations.of(context)!;

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Row(
            children: [
              const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 35,
              ),
              const SizedBox(width: 10),
              Text(l10n.success),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Text(
                "✅ ${l10n.scanCompleted}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 12),

              Text(
                l10n.cropAnalyzed,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(l10n.viewResult),
            ),

          ],
        );
      },
    );
  }


  Future<void> detectDisease() async {
    final l10n = AppLocalizations.of(context)!;

    if (_image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.selectImageFirst),
        ),
      );
      return;
    }


    setState(() {
      _loading = true;
    });

    showLoadingDialog();

    try {
      // Sending selected image to AI service
      final DiseaseModel result = await apiService.detectDisease(_image!);

      // Save scan into history
      await historyService.saveScan(
        result,
        _image!.path,
      );

      if (mounted) {
        Navigator.pop(context);
      }

      await showSuccessDialog();

      print("History Saved Successfully");

      setState(() {
        _loading = false;
      });

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ResultScreen(
            disease: result,
            image: _image!,
          ),
        ),
      );
    } catch (e) {
      if (mounted) {
        Navigator.pop(context);
      }
      setState(() {
        _loading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("${l10n.error}: ${e.toString()}"),
        ),
      );
    }
  }



  Widget button(
      IconData icon,
      String title,
      Color color,
      VoidCallback onTap,
      ) {

    return SizedBox(
      width: double.infinity,
      height: 55,

      child: ElevatedButton.icon(

        icon: Icon(icon),

        label: Text(
          title,
          style: const TextStyle(fontSize: 18),
        ),

        style: ElevatedButton.styleFrom(

          backgroundColor: color,
          foregroundColor: Colors.white,

          elevation: 4,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),

        ),

        onPressed: onTap,

      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(

      appBar: AppBar(

        title: Text(l10n.scanCrop),

        centerTitle: true,

        backgroundColor: Colors.green,

        foregroundColor: Colors.white,

      ),


      body: SingleChildScrollView(

        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8,
        ),


        child: Column(

          children: [


            const Icon(
              Icons.eco,
              size: 65,
              color: Colors.green,
            ),



            const SizedBox(height: 5),



            Text(

              l10n.scanTitle,

              style: const TextStyle(

                fontSize: 26,

                fontWeight: FontWeight.bold,

              ),

            ),



            const SizedBox(height: 5),



            Text(

              l10n.scanSubtitle,

              style: const TextStyle(

                color: Colors.grey,

              ),

            ),



            const SizedBox(height: 10),



            Container(

              height: 300,

              width: double.infinity,


              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(15),

                color: Colors.green.shade50,


                border: Border.all(

                  color: Colors.green,

                  width: 2,

                ),

              ),



              child: _image == null

                  ? Column(

                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [

                        const Icon(

                          Icons.image,

                          size: 80,

                          color: Colors.green,

                        ),

                        const SizedBox(height: 10),

                        Text(l10n.noImageSelected),

                      ],

                    )


                  : ClipRRect(

                      borderRadius: BorderRadius.circular(15),

                      child: Image.file(

                        _image!,

                        fit: BoxFit.contain,

                      ),

                    ),

            ),



            const SizedBox(height: 15),


            // Camera button only shown on Android (avoids crash on Windows,
            // where the camera plugin has no desktop implementation).
            if (!kIsWeb && Platform.isAndroid) ...[
              button(
                Icons.camera_alt,
                l10n.openCamera,
                Colors.green,
                pickCamera,
              ),

              const SizedBox(height: 12),
            ],



            button(

              Icons.photo_library,

              l10n.openGallery,

              Colors.blue,

              pickGallery,

            ),



            const SizedBox(height: 12),



            SizedBox(

              width: double.infinity,

              height: 55,


              child: ElevatedButton.icon(

                onPressed: _loading ? null : detectDisease,


                icon: _loading

                    ? const SizedBox(

                        height: 20,

                        width: 20,

                        child: CircularProgressIndicator(

                          color: Colors.white,

                          strokeWidth: 2,

                        ),

                      )

                    : const Icon(Icons.psychology),



                label: Text(

                  _loading

                      ? l10n.detecting

                      : l10n.detectDisease,


                  style: const TextStyle(

                    fontSize: 18,

                  ),

                ),



                style: ElevatedButton.styleFrom(

                  backgroundColor: Colors.orange,

                  foregroundColor: Colors.white,

                ),

              ),

            ),


          ],

        ),

      ),

    );

  }
}