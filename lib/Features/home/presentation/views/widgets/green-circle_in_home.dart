import 'package:flutter/material.dart';
import 'package:y_balash/core/constants/constants.dart';

class GreenCircleInHome extends StatelessWidget {
  const GreenCircleInHome({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * (251 / 932),
      width: screenWidth,
      decoration: BoxDecoration(
        color: kTextFieldAndButtomColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.elliptical(
            screenWidth * (180 / 430),
            screenWidth * (130 / 430),
          ),
          bottomRight: Radius.elliptical(
            screenWidth * (180 / 430),
            screenWidth * (130 / 430),
          ),
        ),
      ),
    );
  }
}
