import 'package:crochet/screens/Login/loginScreen.dart';
import 'package:crochet/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyWelcomeScreen extends StatefulWidget {
  const MyWelcomeScreen({super.key});

  @override
  State<MyWelcomeScreen> createState() => _MyWelcomeScreenState();
}

class _MyWelcomeScreenState extends State<MyWelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    double screenWidth = MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;

    _animation = Tween<double>(begin: -screenWidth, end: screenWidth)
        .animate(_controller);

    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();
        _controller.forward(); // Restart animation from left
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color.fromARGB(255, 203, 15, 15),
              const Color.fromARGB(255, 0, 0, 0),
            ],
          ),
        ),
        child: Stack(
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Positioned(
                  top: 20, // Lowered slightly
                  left: _animation.value,
                  child: Lottie.asset(
                    "assets/Lottie/splash_anim.json",
                    height: screenHeight * 0.9, // Maximized size
                    width: screenWidth * 1.2, // Extended width
                  ),
                );
              },
            ),
            Positioned(
              bottom: 210,
              left: 25,
              child: Text(
                "L e v e l   u p   y o u r",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25, // Increased font size
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              bottom: 180,
              left: 25,
              child: Text(
                "P e r s o n a l i t y . . . . . .",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              bottom: 135,
              left: 25,
              child: Text(
                'More than 10,000 Bags placed',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            Positioned(
              bottom: 110,
              left: 25,
              child: Text(
                'All over India successfully !',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              left: 25,
              right: 25,
              child: SizedBox(
                height: 60, // Larger button
                width: screenWidth,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      const Color.fromARGB(255, 8, 117, 171),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Let's get started",
                    style: TextStyle(
                      fontSize: 18, // Bigger text
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
