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
    double getProportionalHeight(BuildContext context, double originalHeight) {
      return (originalHeight / 932) * MediaQuery.of(context).size.height;
    }

    double getProportionalWidth(BuildContext context, double originalWidth) {
      return (originalWidth / 430) * MediaQuery.of(context).size.width;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: backgorundColor,
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.all(
                Radius.circular(getProportionalWidth(context, 50)))),
        height: height,
        width: width,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (image != null)
                Padding(
                  padding: EdgeInsets.only(
                    right: getProportionalWidth(context, 8),
                  ), // Space between image and text
                  child: Image.asset(
                    image!,
                    height: getProportionalHeight(
                        context, 24), // Adjust size if needed
                    width: getProportionalWidth(context, 24),
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
