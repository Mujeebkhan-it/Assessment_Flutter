import 'package:crochet/constants.dart';
import 'package:crochet/models/product.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final Products products;
  final Function? press;
  const ItemCard({
    required this.products,
    this.press,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press as void Function()?,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: products.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  products.images[0],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              products.title,
              style: TextStyle(color: const Color.fromARGB(255, 210, 201, 201)),
            ),
          ),
          Text(
            "Rs:- ${products.price}/-",
            style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),
          ),
        ],
      ),
    );
  }
}
