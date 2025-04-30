import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:crochet/models/product.dart';


class PaymentScreen extends StatelessWidget {

  final Products product;
  final String address; // Accept the address from CheckoutScreen
  final String whatsappNumber = "919377749571";
  final String instagramUrl =
      "https://www.instagram.com/knotique.17/?hl=en"; // Replace with your Instagram URL

  const PaymentScreen(
      {super.key, required this.product, required this.address});

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // WhatsApp message including the product details & shipping address
    String productDetails = '''
I want to buy the following product:

Product Name: ${product.title}
Price: ₹${product.price}

Please send me the product photos.
Please confirm my order.

Shipping Address:
$address         
''';    
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Complete Your Payment"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Background Gradient using Product Color
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [product.color, product.color.withOpacity(0.2)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // Payment Content
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // QR Code Card with Glassmorphism Effect
                  GlassContainer(
                    productColor: product.color,
                    child: Column(
                      children: [
                        Text(
                          "Scan to Pay",
                          style: TextStyle(
                            fontSize: screenWidth * 0.05,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),

                        // QR Code Image
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 10,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              "assets/images/PaymentQr/payment.png",
                              width: screenWidth * 0.6, // QR Code size adapts
                              height: screenWidth * 0.6,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.015),

                        Text(
                          "PhonePe | Google Pay | Paytm",
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.bold,
                            color: Colors.white70,
                          ),
                        ),
                        Text(
                          "Please share a screenshot of your payment",
                          style: TextStyle(
                            fontSize: screenWidth * 0.035,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(179, 80, 10, 4),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.05),

                  // WhatsApp Order Confirmation Button
                  SizedBox(
                    width: screenWidth * 0.7,
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        Uri whatsappUri = Uri.parse(
                            "https://wa.me/$whatsappNumber?text=${Uri.encodeComponent(productDetails)}");

                        if (await canLaunchUrl(whatsappUri)) {
                          await launchUrl(whatsappUri,
                              mode: LaunchMode.externalApplication);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Could not open WhatsApp")),
                          );
                        }
                      },
                      icon: const Icon(Icons.chat, color: Colors.white),
                      label: const Text(
                        "Confirm your order",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.1,
                          vertical: screenHeight * 0.015,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        elevation: 5,
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.02),

                  // Instagram Button
                  SizedBox(
                    width: screenWidth * 0.7,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFFFEDA75), // Yellow
                            Color(0xFFFA7E1E), // Orange
                            Color(0xFFD62976), // Pink
                            Color(0xFF962FBF), // Purple
                            Color(0xFF4F5BD5), // Blue
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          Uri instagramUri = Uri.parse(instagramUrl);

                          if (await canLaunchUrl(instagramUri)) {
                            await launchUrl(instagramUri,
                                mode: LaunchMode.externalApplication);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Could not open Instagram"),
                              ),
                            );
                          }
                        },
                        icon: const Icon(Icons.camera_alt, color: Colors.white),
                        label: const Text(
                          "Visit Our Instagram",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.transparent, // Make button transparent
                          shadowColor:
                              Colors.transparent, // Remove unwanted shadows
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.1,
                            vertical: screenHeight * 0.015,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Glass Container Widget
class GlassContainer extends StatelessWidget {
  final Widget child;
  final Color productColor;
  const GlassContainer(
      {super.key, required this.child, required this.productColor});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(screenWidth * 0.05),
      decoration: BoxDecoration(
        color: productColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: child,
    );
  }
}
