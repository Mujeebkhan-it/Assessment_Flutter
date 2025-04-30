import 'package:crochet/constants.dart';
import 'package:crochet/models/product.dart';
import 'package:flutter/material.dart';


class Discription extends StatelessWidget {
  const Discription({
    super.key,
    required this.products,
  });

  final Products products;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: kDefaultPaddin,
      ),
      child: Text(
        products.description,
        style: TextStyle(height: 1.5),
      ),
    );
  }
}
