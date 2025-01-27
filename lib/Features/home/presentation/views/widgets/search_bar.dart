import 'package:flutter/material.dart';
import 'package:y_balash/core/constants/constants.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar(
      {super.key, required this.screenWidth, required this.screenHeight});
  final double screenHeight;
  final double screenWidth;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth * (345 / 430),
      height: screenHeight * (53 / 932),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search...',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          filled: true,
          fillColor: kPrimaryColor,
        ),
        onChanged: (value) {
          // Handle search text changes
        },
      ),
    );
  }
}
