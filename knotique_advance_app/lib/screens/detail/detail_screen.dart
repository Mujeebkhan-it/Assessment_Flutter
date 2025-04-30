import 'package:crochet/constants.dart';
import 'package:crochet/models/product.dart';
import 'package:crochet/screens/detail/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetailScreen extends StatelessWidget {
  final Products products;
  const DetailScreen({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: products.color,
      appBar: buildAppbar(context),
      body: Body(products: products),
    );
  }

  AppBar buildAppbar(BuildContext context) {
    return AppBar(
      backgroundColor: products.color,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset("assets/icons/cart.svg"),
          onPressed: () {},
        ),
        SizedBox(
          width: kDefaultPaddin / 2,
        ),
      ],
    );
  }
}
