import 'package:flutter/material.dart';
import 'package:y_balash/core/constants/constants.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({
    super.key,
    required this.label,
    required this.height,
    required this.width,
    required this.backgorundColor,
    required this.textColor,
    required this.borderColor,
    this.image,
    required this.onTap,
  });
  final String label;
  final dynamic height;
  final dynamic width;
  final Color backgorundColor;
  final Color textColor;
  final Color borderColor;
  final String? image;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: backgorundColor,
            border: Border.all(color: borderColor),
            borderRadius:
                BorderRadius.all(Radius.circular(screenWidth * (50 / 430)))),
        height: height,
        width: width,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (image != null)
                Padding(
                  padding: EdgeInsets.only(
                      right: screenWidth *
                          (8 / 430)), // Space between image and text
                  child: Image.asset(
                    image!,
                    height: screenHeight * (24 / 930), // Adjust size if needed
                    width: screenWidth * (24 / 430),
                  ),
                ),
              Text(
                label,
                style: TextStyle(color: textColor, fontFamily: kIneraFont),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
