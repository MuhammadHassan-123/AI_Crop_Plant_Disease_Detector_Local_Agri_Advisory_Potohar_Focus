import 'package:flutter/material.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );

    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.green,

      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            CircleAvatar(
              radius: 55,

              backgroundColor: Colors.white,

              child: Icon(
                Icons.eco,
                size: 70,
                color: Colors.green,
              ),
            ),


            const SizedBox(height: 25),


            const Text(
              "AI Crop Disease Detector",

              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),


            const SizedBox(height: 10),


            const Text(
              "Smart Agriculture Assistant",

              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),


            const SizedBox(height: 40),


            const CircularProgressIndicator(
              color: Colors.white,
            ),

          ],

        ),

      ),

    );

  }
}