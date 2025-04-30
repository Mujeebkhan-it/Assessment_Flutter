import 'package:crochet/screens/Welcome/welcomeScreen.dart';
import 'package:crochet/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboardingscreen extends StatefulWidget {
  const Onboardingscreen({super.key});

  @override
  State<Onboardingscreen> createState() => _OnboardingscreenState();
}

class _OnboardingscreenState extends State<Onboardingscreen> {
  final controller = LiquidController();
  int currentPage = 0;

  final List<Map<String, dynamic>> productPages = [
    {
      'gradientColors': [
        const Color.fromARGB(255, 0, 0, 0),
        const Color.fromARGB(255, 231, 27, 27),
      ],
      'imagePath': 'assets/images/bags/rose_bag.jpg',
      'title': 'Rose Bag',
      'description':
          'This crochet bag showcases a unique braided design in earthy tones',
      'titleColor': Color.fromARGB(255, 240, 220, 131),
      'progress': '1/3',
    },
    {
      'gradientColors': [
        Color.fromARGB(255, 0, 0, 0),
        const Color.fromARGB(255, 240, 220, 131),
      ],
      'imagePath': 'assets/images/bags/beige_cream.jpg',
      'title': 'Beige Cream Bag',
      'description':
          'This crochet bag features custom embroidered initials with a heart, a braided handle.',
      'titleColor': Color.fromARGB(255, 5, 53, 74),
      'progress': '2/3',
    },
    {
      'gradientColors': [
        Color.fromARGB(255, 0, 5, 8),
        Color.fromARGB(255, 64, 84, 145)
      ],
      'imagePath': 'assets/images/bags/blue_shdes.jpg',
      'title': 'Blue Shades Bag',
      'description':
          'Stylish, durable, and uniquely personalized—perfect as an accessory or gift!',
      'titleColor': Color.fromARGB(255, 101, 174, 235),
      'progress': '3/3',
    },
  ];

  bool? canChange = true;

  @override
  void initState() {
    super.initState();
    canChange = true;
  }

  @override
  void dispose() {
    super.dispose();
    canChange = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: productPages.map((page) {
              return buildPage(
                gradientColors: page['gradientColors'],
                imagePath: page['imagePath'],
                title: page['title'],
                description: page['description'],
                titleColor: page['titleColor'],
                progress: page['progress'],
              );
            }).toList(),
            onPageChangeCallback: onPageChangeCallback,
            liquidController: controller,
            slideIconWidget: const Icon(Icons.arrow_back_ios),
            enableSideReveal: true,
          ),
          // Positioned(
          //   bottom: 60,
          //   child: IconButton(
          //     onPressed: () {
          //       int nextPage = controller.currentPage + 1;
          //       controller.animateToPage(page: nextPage);
          //     },
          //     icon: const Icon(
          //       size: 38,
          //       Icons.arrow_forward_rounded,
          //     ),
          //   ),
          // ),
          Positioned(
            top: 30,
            right: 20,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => MyWelcomeScreen(),
                  ),
                  (route) => false,
                );
              },
              child: const Text(
                "Skip",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            child: AnimatedSmoothIndicator(
              activeIndex: controller.currentPage,
              count: productPages.length,
              effect: const WormEffect(
                activeDotColor: Colors.black,
                dotHeight: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPage({
    required List<Color> gradientColors,
    required String imagePath,
    required String title,
    required String description,
    required Color titleColor,
    required String progress,
  }) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: titleColor,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    description,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              progress,
              style: const TextStyle(
                fontSize: 20,
                color: Color.fromARGB(168, 0, 0, 0),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  void onPageChangeCallback(int activePageIndex) {
    if (canChange == true) {
      setState(() {
        currentPage = activePageIndex;
      });
    }
  }
}
