import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:birthday_app/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 5));
    if (mounted) {
      // Adjust the duration as needed
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const HomePage()), // Replace with your home page widget
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.white, // Set the same background color as your login screen
      body: Center(
        child: SizedBox(
          width: 300, // Adjust the width as needed
          height: 300, // Adjust the height as needed
          child: Lottie.asset(
            'assets/animation.json', // Replace with the path to your Lottie JSON file
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
