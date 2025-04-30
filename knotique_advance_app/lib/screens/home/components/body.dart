import 'dart:async';
import 'package:crochet/constants.dart';
import 'package:crochet/models/product.dart';
import 'package:crochet/screens/Profile/profile.dart';
import 'package:crochet/screens/detail/detail_screen.dart';
import 'package:crochet/screens/home/components/categories.dart';
import 'package:crochet/screens/home/components/item_card.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final List<Color> _colors = [
    const Color.fromARGB(255, 236, 60, 29),
    const Color.fromARGB(255, 0, 0, 0),
    
  ];
  int _currentColorIndex = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        _currentColorIndex = (_currentColorIndex + 1) % _colors.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 2),
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [
            _colors[_currentColorIndex],
            _colors[(_currentColorIndex + 1) % _colors.length],
          ],
          radius: 0.85,
           center: Alignment(0.0, 0.0),
          // begin: Alignment.topCenter,
          // end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "K n o t i q u e",
                  style: TextStyle(
                    color: const Color.fromARGB(139, 255, 255, 255),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: IconButton(
                    onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfileScreen()));
                    },
                    icon: Icon(Icons.person, color: const Color.fromARGB(139, 255, 255, 255),size: 30),
                    ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Categories(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 1),
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  mainAxisSpacing: kDefaultPaddin,
                ),
                itemBuilder: (context, index) => ItemCard(
                  products: products[index],
                  press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        products: products[index],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

