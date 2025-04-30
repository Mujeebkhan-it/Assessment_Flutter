import 'package:crochet/constants.dart';
import 'package:crochet/models/product.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetailTitleImage extends StatefulWidget {
  const DetailTitleImage({
    super.key,
    required this.products,
    required this.imageHeight,
    required this.imageWidth,
  });

  final Products products;
  final double imageHeight;
  final double imageWidth;

  @override
  State<DetailTitleImage> createState() => _DetailTitleImageState();
}

class _DetailTitleImageState extends State<DetailTitleImage> {
  int activeIndex = 0;
  // final CarouselController _controller = CarouselController(); // Proper Controller

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cool Handmade Bag",
            style: TextStyle(color: Colors.white),
          ),
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0.2, end: 1.0),
            duration: Duration(seconds: 1),
            curve: Curves.easeOut,
            builder: (context, value, child) {
              return Opacity(
                opacity: value,
                child: Transform.scale(
                  scale: value,
                  child: Text(
                    widget.products.title,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
          ),
          SizedBox(height: kDefaultPaddin),
          Row(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Price\n",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: "Rs :- ${widget.products.price}/-",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CarouselSlider.builder(
                        itemCount: widget.products.images.length,
                        itemBuilder: (context, index, realIndex) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              widget.products.images[index],
                              width: MediaQuery.of(context).size.width * 0.8, // 80% of screen width

                              fit: BoxFit.fill,
                            ),
                          );
                        },
                        options: CarouselOptions(
                          // 80% of screen width
                          height: MediaQuery.of(context).size.height * 0.25, // Adjust height dynamically
                          autoPlay: true,
                          enlargeCenterPage: true,
                          viewportFraction: 0.8,
                          onPageChanged: (index, reason) {
                            setState(() {
                              activeIndex = index;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Smooth Page Indicator
                    AnimatedSmoothIndicator(
                      activeIndex: activeIndex,
                      count: widget.products.images.length,
                      effect: ExpandingDotsEffect(
                        dotHeight: 8,
                        dotWidth: 8,
                        activeDotColor: widget.products.color,
                        dotColor: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
