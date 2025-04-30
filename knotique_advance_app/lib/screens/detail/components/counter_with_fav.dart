import 'package:flutter/material.dart';
import 'package:crochet/models/product.dart';
import 'package:crochet/screens/detail/components/Cart_counter.dart';

class CounterWithFavIcon extends StatefulWidget {
  const CounterWithFavIcon({
    super.key,
    required this.products,
  });

  final Products products;

  @override
  _CounterWithFavIconState createState() => _CounterWithFavIconState();
}

class _CounterWithFavIconState extends State<CounterWithFavIcon> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CartCounter(),
        GestureDetector(
          onTap: () {
            setState(() {
              isFavorite = !isFavorite;
            });
          },
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(scale: animation, child: child);
            },
            child: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              key: ValueKey<bool>(isFavorite),
              size: 35,
              color: widget.products.color,
            ),
          ),
        ),
      ],
    );
  }
}
