import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../services/api_service.dart';
import 'result_screen.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  final ImagePicker _picker = ImagePicker();

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


  Future<void> detectDisease() async {

    if (_image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please select an image first."),
        ),
      );
      return;
    }


    setState(() {
      _loading = true;
    });


    // Sending selected image to AI service
    final result = await ApiService().detectDisease(_image!);


    setState(() {
      _loading = false;
    });


    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ResultScreen(
          diseaseName: result["name"],
          confidence: result["confidence"],
          remedy: result["remedy"],
        ),
      ),
    );

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

    return Scaffold(

      appBar: AppBar(

        title: const Text("Scan Crop"),

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



            const Text(

              "Crop Disease Detection",

              style: TextStyle(

                fontSize: 26,

                fontWeight: FontWeight.bold,

              ),

            ),



            const SizedBox(height: 5),



            const Text(

              "Capture or upload a leaf image",

              style: TextStyle(

                color: Colors.grey,

              ),

            ),



            const SizedBox(height: 10),



            Container(

              height: 150,

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

                  ? const Column(

                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [

                        Icon(

                          Icons.image,

                          size: 80,

                          color: Colors.green,

                        ),

                        SizedBox(height: 10),

                        Text("No Image Selected"),

                      ],

                    )


                  : ClipRRect(

                      borderRadius: BorderRadius.circular(15),

                      child: Image.file(

                        _image!,

                        fit: BoxFit.cover,

                      ),

                    ),

            ),



            const SizedBox(height: 15),



            button(

              Icons.camera_alt,

              "Open Camera",

              Colors.green,

              pickCamera,

            ),



            const SizedBox(height: 12),



            button(

              Icons.photo_library,

              "Open Gallery",

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

                      ? "Detecting..."

                      : "Detect Disease",


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