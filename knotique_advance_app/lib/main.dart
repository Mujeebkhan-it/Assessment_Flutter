import 'package:crochet/constants.dart';
import 'package:crochet/screens/Login/loginScreen.dart';
import 'package:crochet/screens/OnBoarding/onBoardingScreen.dart';
import 'package:crochet/screens/Profile/profile.dart';
import 'package:crochet/screens/Register/register.dart';
import 'package:crochet/screens/Welcome/welcomeScreen.dart';
import 'package:crochet/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crochet Couture',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home : Onboardingscreen(),
    );
  }
}
