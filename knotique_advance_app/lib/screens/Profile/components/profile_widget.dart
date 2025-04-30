import 'package:flutter/material.dart';

// ignore: camel_case_types
class profile_widget extends StatelessWidget {
  final IconData icon;
  final String title;

  const profile_widget({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                 color: Color.fromARGB(174, 255, 255, 255),
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                title,
                style: TextStyle(
                   color: Color.fromARGB(174, 255, 255, 255),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Color.fromARGB(174, 255, 255, 255),
            size: 16,
          ),
        ],
      ),
    );
  }
}
