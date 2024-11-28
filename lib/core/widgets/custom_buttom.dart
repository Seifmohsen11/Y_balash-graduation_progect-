import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  });
  final String label;
  final dynamic height;
  final dynamic width;
  final Color backgorundColor;
  final Color textColor;
  final Color borderColor;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            color: backgorundColor,
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.all(Radius.circular(50.w))),
        height: height,
        width: width,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (image != null)
                Padding(
                  padding: EdgeInsets.only(
                      right: 8.w), // Space between image and text
                  child: Image.asset(
                    image!,
                    height: 24.h, // Adjust size if needed
                    width: 24.w,
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
