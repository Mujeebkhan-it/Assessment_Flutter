import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:crochet/screens/Welcome/welcomeScreen.dart';
import 'package:flutter/material.dart';

class MySplashScreen extends StatelessWidget {
  const MySplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                'assets/images/Logo/appLogo.png',
                height: 150, 
                width: 150,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "K N O T I Q U E",
              style: TextStyle(
                color: Color.fromARGB(255, 150, 126, 5),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      splashIconSize: 250, 
      backgroundColor: Colors.black,
      nextScreen: const MyWelcomeScreen(),
    );
  }
}

