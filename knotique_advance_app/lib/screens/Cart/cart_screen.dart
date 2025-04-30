import 'package:crochet/screens/CheckOutScreen/checkOut.dart';
import 'package:flutter/material.dart';
import 'package:crochet/models/product.dart';

class CartScreen extends StatelessWidget {
  final Products product;

  const CartScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenWidth = size.width;
    double screenHeight = size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
        backgroundColor: product.color,
      ),
      body: SingleChildScrollView(  
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Shopping Cart",
                style: TextStyle(fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: screenHeight * 0.02),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: screenWidth * 0.25,
                        height: screenWidth * 0.25,
                        decoration: BoxDecoration(
                          color: product.color.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            product.images[0],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.05),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.title,
                              style: TextStyle(fontSize: screenWidth * 0.045, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: screenHeight * 0.01),
                            Text(
                              "Price: ₹${product.price}",
                              style: TextStyle(fontSize: screenWidth * 0.04, fontWeight: FontWeight.w600, color: Colors.green),
                            ),
                            SizedBox(height: screenHeight * 0.01),
                            Row(
                              children: [
                                Icon(Icons.color_lens, size: screenWidth * 0.05, color: product.color),
                                SizedBox(width: 5),
                                Text(
                                  "Color",
                                  style: TextStyle(fontSize: screenWidth * 0.035, fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.47),
              Container(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 2),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total", style: TextStyle(fontSize: screenWidth * 0.045, fontWeight: FontWeight.bold)),
                        Text(
                          "₹${product.price}",
                          style: TextStyle(fontSize: screenWidth * 0.045, fontWeight: FontWeight.bold, color: Colors.green),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CheckoutScreen(product: product)),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: product.color,
                          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: Text(
                          "Proceed to Checkout",
                          style: TextStyle(fontSize: screenWidth * 0.045, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
