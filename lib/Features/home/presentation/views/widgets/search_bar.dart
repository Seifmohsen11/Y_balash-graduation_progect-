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
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(
              color: const Color(0xff8A8A8A),
              fontSize: screenWidth * (20 / 430),
              fontFamily: kInriaSansFont),
          prefixIcon: Icon(
            Icons.search,
            size: screenWidth * (24 / 430),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(screenWidth * (32 / 430)),
          ),
          filled: true,
          fillColor: kPrimaryColor,
          contentPadding:
              EdgeInsets.symmetric(vertical: screenHeight * (10 / 932)),
        ),
        onChanged: (value) {
          // Handle search text changes
        },
      ),
    );
  }
}
