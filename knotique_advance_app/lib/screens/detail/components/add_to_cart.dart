import 'package:crochet/models/product.dart';
import 'package:crochet/screens/Cart/cart_screen.dart';
import 'package:flutter/material.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({
    super.key,
    required this.products,
  });

  final Products products;

  @override
  // ignore: library_private_types_in_public_api
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  bool isAddedToCart = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isAddedToCart = !isAddedToCart;
              });
            },
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    key: ValueKey<bool>(!isAddedToCart),
                    size: 35,
                    color: isAddedToCart ? Colors.white : widget.products.color,
                  ),
                  if (isAddedToCart)
                    Icon(
                      Icons.shopping_cart,
                      key: ValueKey<bool>(isAddedToCart),
                      size: 35,
                      color: widget.products.color,
                    ),
                ],
              ),
            ),
          ),
          SizedBox(width: 20), // Space between icon and button
          Expanded(
            child: SizedBox(
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  backgroundColor: widget.products.color,
                ),
                onPressed: () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(product: widget.products),
                    ),
                  );
                },
                child: Text(
                  "Buy Now".toUpperCase(),
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
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
