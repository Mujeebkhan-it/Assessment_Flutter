import 'package:crochet/models/product.dart';
import 'package:crochet/screens/detail/components/Color_size.dart';
import 'package:crochet/screens/detail/components/add_to_cart.dart';
import 'package:crochet/screens/detail/components/counter_with_fav.dart';
import 'package:crochet/screens/detail/components/discription.dart';
import 'package:crochet/screens/detail/components/detail_title_image.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final Products products;
  const Body({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double imageWidth = size.width * 0.4; 
    double imageHeight = size.height * 0.3; 
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: 20,
                    right: 20,
                  ),
                  // height: 600,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      ColorSize(products: products),
                      Discription(products: products),
                      SizedBox(height: 15),
                      CounterWithFavIcon(products: products),
                      SizedBox(height: 15),
                      AddToCart(products: products),
                    ],
                  ),
                ),
                DetailTitleImage(
                  products: products,
                  imageHeight: imageHeight,
                  imageWidth: imageWidth,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
