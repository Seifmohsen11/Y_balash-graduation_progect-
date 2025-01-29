import 'package:flutter/material.dart';
import 'package:y_balash/core/constants/constants.dart';

class ItemOfCategory extends StatelessWidget {
  const ItemOfCategory(
      {super.key,
      required this.screenWidth,
      required this.screenHeight,
      required this.image,
      required this.title,
      required this.onTap});
  final double screenHeight;
  final double screenWidth;
  final String image;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: screenHeight * (70 / 932),
            width: screenWidth * (70 / 430),
            decoration: BoxDecoration(
                color: kPrimaryColor,
                image: DecorationImage(
                  image: AssetImage(image),
                ),
                borderRadius: BorderRadius.circular(36)),
          ),
          SizedBox(
            height: screenHeight * (3 / 932),
          ),
          Text(
            title,
            style: const TextStyle(color: kTextFieldAndButtomColor),
          )
        ],
      ),
    );
  }
}
