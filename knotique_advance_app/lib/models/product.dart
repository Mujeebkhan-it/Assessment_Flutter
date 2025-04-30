import 'package:flutter/material.dart';

class Products {
  final int id, price, size;
  final String title, description;
  final List<String> images; 
  final Color color;

  Products({
    required this.id,
    required this.title,
    required this.price,
    required this.size,
    required this.description,
    required this.images, 
    required this.color,
  });
}

List<Products> products = [
  Products(
    id: 13,
    title: "Rose Bag",
    price: 2400,
    size: 12,
    description:
        "This handcrafted crochet bag features custom embroidered initials with a heart, a braided handle, a soft tassel, and a matching heart keychain. Stylish, durable, and uniquely personalized—perfect as an accessory or gift!",
    images: [
          "assets/images/bags/rose_bag.jpg",
          "assets/images/bags/rose_bag.jpg",
          "assets/images/bags/rose_bag.jpg",
    ],
    color: Color.fromARGB(255, 164, 32, 32),
  ),
  Products(
    id: 12,
    title: "Red & Beige",
    price: 2300,
    size: 12,
    description:
        "This handcrafted crochet bag showcases a unique braided design in earthy tones, a sturdy handle, a gold chain strap, and a secure metal clasp. Lightweight and stylish, it’s the perfect blend of elegance and functionality for any occasion!",
    images: [
      "assets/images/bags/red_beige.jpg",
      "assets/images/bags/red_beige.jpg",
      "assets/images/bags/red_beige.jpg",
    ],
    color: Color.fromARGB(255, 220, 67, 93),
  ),
  Products(
    id: 11,
    title: "Pink & Shades",
    price: 2200,
    size: 12,
    description:
        "This handcrafted crochet bag features custom embroidered initials with a heart, a braided handle, a soft tassel, and a matching heart keychain. Stylish, durable, and uniquely personalized—perfect as an accessory or gift!",
    images: [
      "assets/images/bags/pink_shades.jpg",
      "assets/images/bags/pink_shades1.jpg",
      "assets/images/bags/pink_shades2.jpg",
    ],
    color: Color.fromARGB(255, 202, 57, 161),
  ),
  Products(
    id: 2,
    title: "Beige & Cream",
    price: 2000,
    size: 12,
    description:
        "This handcrafted crochet bag showcases a unique braided design in earthy tones, a sturdy handle, a gold chain strap, and a secure metal clasp. Lightweight and stylish, it’s the perfect blend of elegance and functionality for any occasion!",
    images: [
      "assets/images/bags/beige_cream.jpg",
      "assets/images/bags/beige_cream.jpg",
      "assets/images/bags/beige_cream.jpg",
    ],
    color: Color.fromARGB(255, 174, 153, 61),
  ),
  Products(
    id: 7,
    title: "Blue Shades",
    price: 1800,
    size: 12,
    description:
        "This handcrafted crochet bag features custom embroidered initials with a heart, a braided handle, a soft tassel, and a matching heart keychain. Stylish, durable, and uniquely personalized—perfect as an accessory or gift!",
    images: [
      "assets/images/bags/blue_shdes.jpg",
      "assets/images/bags/blue_shdes.jpg",
      "assets/images/bags/blue_shdes.jpg",
    ],
    color: Color(0xFF3D82AE),
  ),
  Products(
    id: 1,
    title: "Beige & Blue",
    price: 2000,
    size: 12,
    description:
        "This handcrafted crochet bag features custom embroidered initials with a heart, a braided handle, a soft tassel, and a matching heart keychain. Stylish, durable, and uniquely personalized—perfect as an accessory or gift!",
    images: [
      "assets/images/bags/beige_blue.jpg",
      "assets/images/bags/beige_blue1.jpg",
      "assets/images/bags/beige_blue2.jpg",
    ],
    color: Color(0xFF3D82AE),
  ),
  Products(
    id: 3,
    title: "Beige & Purple",
    price: 1600,
    size: 12,
    description:
        "This handcrafted crochet bag features custom embroidered initials with a heart, a braided handle, a soft tassel, and a matching heart keychain. Stylish, durable, and uniquely personalized—perfect as an accessory or gift!",
    images: [
      "assets/images/bags/beige_purple.jpg",
      "assets/images/bags/beige_purple.jpg",
      "assets/images/bags/beige_purple.jpg",
    ],
    color: Color.fromARGB(255, 193, 102, 227),
  ),
  Products(
    id: 4,
    title: "Beige & Red",
    price: 1600,
    size: 12,
    description:
        "This handcrafted crochet bag showcases a unique braided design in earthy tones, a sturdy handle, a gold chain strap, and a secure metal clasp. Lightweight and stylish, it’s the perfect blend of elegance and functionality for any occasion!",
    images: [
      "assets/images/bags/beige_red.jpg",
      "assets/images/bags/beige_red1.jpg",
      "assets/images/bags/beige_red2.jpg",
    ],
    color: Color.fromARGB(255, 219, 66, 91),
  ),
  Products(
    id: 5,
    title: "Blue & Beige",
    price: 1800,
    size: 12,
    description:
        "This handcrafted crochet bag features custom embroidered initials with a heart, a braided handle, a soft tassel, and a matching heart keychain. Stylish, durable, and uniquely personalized—perfect as an accessory or gift!",
    images: [
      "assets/images/bags/blue_beige.jpg",
      "assets/images/bags/blue_beige.jpg",
      "assets/images/bags/blue_beige.jpg"
    ],
    color: Color(0xFF3D82AE),
  ),
  Products(
    id: 6,
    title: "Blue & Grey",
    price: 1700,
    size: 12,
    description:
        "This handcrafted crochet bag showcases a unique braided design in earthy tones, a sturdy handle, a gold chain strap, and a secure metal clasp. Lightweight and stylish, it’s the perfect blend of elegance and functionality for any occasion!",
    images: [
      "assets/images/bags/blue_grey.jpg",
      "assets/images/bags/blue_grey.jpg",
      "assets/images/bags/blue_grey.jpg",
    ],
    color: Color.fromARGB(255, 83, 91, 95),
  ),
  Products(
    id: 8,
    title: "Brown & Beige",
    price: 2200,
    size: 12,
    description:
        "This handcrafted crochet bag showcases a unique braided design in earthy tones, a sturdy handle, a gold chain strap, and a secure metal clasp. Lightweight and stylish, it’s the perfect blend of elegance and functionality for any occasion!",
    images: [
      "assets/images/bags/brown_beige.jpg",
      "assets/images/bags/brown_beige.jpg",
      "assets/images/bags/brown_beige.jpg",
    ],
    color: Color.fromARGB(255, 136, 70, 40),
  ),
  Products(
    id: 10,
    title: "Pink & Purple",
    price: 2200,
    size: 12,
    description:
        "This handcrafted crochet bag showcases a unique braided design in earthy tones, a sturdy handle, a gold chain strap, and a secure metal clasp. Lightweight and stylish, it’s the perfect blend of elegance and functionality for any occasion!",
    images: [
      "assets/images/bags/pink_purple.jpg",
      "assets/images/bags/pink_purple.jpg",
      "assets/images/bags/pink_purple.jpg",
    ],
    color: Color.fromARGB(255, 179, 45, 228),
  ),
  Products(
    id: 14,
    title: "Yellow & Beige",
    price: 2100,
    size: 12,
    description:
        "This handcrafted crochet bag showcases a unique braided design in earthy tones, a sturdy handle, a gold chain strap, and a secure metal clasp. Lightweight and stylish, it’s the perfect blend of elegance and functionality for any occasion!",
    images: [
      "assets/images/bags/yellow_beige.jpg",
      "assets/images/bags/yellow_beige.jpg",
      "assets/images/bags/yellow_beige.jpg"
    ],
    color: Color.fromARGB(255, 253, 240, 127),
  ),
  Products(
    id: 9,
    title: "Multiy Colors",
    price: 2400,
    size: 12,
    description:
        "This handcrafted crochet bag features custom embroidered initials with a heart, a braided handle, a soft tassel, and a matching heart keychain. Stylish, durable, and uniquely personalized—perfect as an accessory or gift!",
    images: [
      "assets/images/bags/multi_color.jpg",
      "assets/images/bags/multi_color.jpg",
      "assets/images/bags/multi_color.jpg"
    ],
    color: Color.fromARGB(255, 120, 78, 237),
  ),
];
