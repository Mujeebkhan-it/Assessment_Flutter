import 'package:crochet/screens/home/components/body.dart';
import 'package:flutter/material.dart';

class MyHomescreen extends StatelessWidget {
  const MyHomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: buildAppbar(),
      body: const Body(),
    );
  }
}
