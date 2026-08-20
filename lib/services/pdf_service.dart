import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../models/disease_model.dart';
import '../models/weather_model.dart';

class PdfService {
  static Future<File> createReport(
    DiseaseModel disease,
    File image,
    WeatherModel? weather,
  ) async {
    // Load Unicode-capable fonts from the asset bundle (works reliably
    // on mobile + desktop release builds, unlike File('assets/...')).
    final regularFontData =
        await rootBundle.load('assets/images/fonts/NotoSans-Regular.ttf');
    final boldFontData =
        await rootBundle.load('assets/images/fonts/NotoSans-Bold.ttf');

    final regularFont = pw.Font.ttf(regularFontData);
    final boldFont = pw.Font.ttf(boldFontData);

    final pdf = pw.Document(
      theme: pw.ThemeData.withFont(
        base: regularFont,
        bold: boldFont,
      ),
    );

    final imageBytes = await image.readAsBytes();
    final pdfImage = pw.MemoryImage(imageBytes);

    pdf.addPage(
      pw.MultiPage(
        margin: const pw.EdgeInsets.all(25),
        build: (context) {
          return [
            pw.Text(
              "AI Crop Disease Detector",
              style: pw.TextStyle(
                fontSize: 25,
                fontWeight: pw.FontWeight.bold,
              ),
            ),

            pw.SizedBox(height: 8),

            pw.Text(
              "AI Plant Disease Detection Report",
              style: const pw.TextStyle(fontSize: 16),
            ),

            pw.Divider(),

            pw.SizedBox(height: 15),

            pw.Center(
              child: pw.Image(
                pdfImage,
                width: 220,
                height: 220,
              ),
            ),

            pw.SizedBox(height: 20),

            pw.Text(
              "Detection Result",
              style: pw.TextStyle(
                fontSize: 20,
                fontWeight: pw.FontWeight.bold,
              ),
            ),

            pw.SizedBox(height: 10),

            pw.Text(
              "Disease: ${disease.name}",
              style: const pw.TextStyle(fontSize: 16),
            ),

            pw.SizedBox(height: 8),

            pw.Text(
              "Confidence: ${(disease.confidence * 100).toStringAsFixed(2)}%",
              style: const pw.TextStyle(fontSize: 16),
            ),

            pw.SizedBox(height: 8),

            pw.Text(
              "Confidence Status: ${disease.confidenceStatus}",
              style: const pw.TextStyle(fontSize: 16),
            ),

            pw.SizedBox(height: 25),

            pw.Text(
              "Top 5 AI Predictions",
              style: pw.TextStyle(
                fontSize: 20,
                fontWeight: pw.FontWeight.bold,
              ),
            ),

            pw.SizedBox(height: 10),

            ...disease.topPredictions.asMap().entries.map(
              (entry) {
                final prediction = entry.value;

                return pw.Padding(
                  padding: const pw.EdgeInsets.only(bottom: 7),
                  child: pw.Text(
                    "${entry.key + 1}. ${prediction.name} - "
                    "${(prediction.confidence * 100).toStringAsFixed(2)}%",
                    style: const pw.TextStyle(fontSize: 15),
                  ),
                );
              },
            ),

            pw.SizedBox(height: 20),

            pw.Text(
              "Recommended Remedy",
              style: pw.TextStyle(
                fontSize: 20,
                fontWeight: pw.FontWeight.bold,
              ),
            ),

            pw.SizedBox(height: 10),

            pw.Text(
              disease.remedy,
              style: const pw.TextStyle(
                fontSize: 15,
              ),
            ),

            pw.SizedBox(height: 25),

            pw.Text(
              "Weather Information",
              style: pw.TextStyle(
                fontSize: 20,
                fontWeight: pw.FontWeight.bold,
              ),
            ),

            pw.SizedBox(height: 10),

            if (weather != null) ...[
              pw.Text(
                "City: ${weather.city}",
                style: const pw.TextStyle(fontSize: 15),
              ),
              pw.SizedBox(height: 6),
              pw.Text(
                "Temperature: ${weather.temperature} °C",
                style: const pw.TextStyle(fontSize: 15),
              ),
              pw.SizedBox(height: 6),
              pw.Text(
                "Humidity: ${weather.humidity}%",
                style: const pw.TextStyle(fontSize: 15),
              ),
              pw.SizedBox(height: 6),
              pw.Text(
                "Weather: ${weather.weather}",
                style: const pw.TextStyle(fontSize: 15),
              ),
            ] else
              pw.Text(
                "Weather information unavailable.",
                style: const pw.TextStyle(fontSize: 15),
              ),

            pw.SizedBox(height: 30),

            pw.Divider(),

            pw.Center(
              child: pw.Text(
                "Generated by AI Crop Disease Detector",
                style: const pw.TextStyle(fontSize: 12),
              ),
            ),
          ];
        },
      ),
    );

    final directory = await getTemporaryDirectory();

    final file = File(
      '${directory.path}/AI_Crop_Disease_Report.pdf',
    );

    await file.writeAsBytes(
      await pdf.save(),
    );

    return file;
  }

  static Future<void> generateReport(
    DiseaseModel disease,
    File image,
    WeatherModel? weather,
  ) async {
    final file = await createReport(
      disease,
      image,
      weather,
    );

    await Printing.layoutPdf(
      onLayout: (format) async => file.readAsBytes(),
    );
  }
}