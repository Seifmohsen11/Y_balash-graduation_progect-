import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    required this.borderRadiusSize,
    this.arrowForSplash,
  });
  final String label;
  final dynamic height;
  final dynamic width;
  final Color backgorundColor;
  final Color textColor;
  final Color borderColor;
  final String? image;
  final String? arrowForSplash;
  final VoidCallback onTap;
  final double borderRadiusSize;

  double getProportionalHeight(BuildContext context, double originalHeight) {
    return (originalHeight / 932) * MediaQuery.of(context).size.height;
  }

  double getProportionalWidth(BuildContext context, double originalWidth) {
    return (originalWidth / 430) * MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: backgorundColor,
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.all(Radius.circular(borderRadiusSize))),
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
                  child: SvgPicture.asset(
                    image!,
                    height: getProportionalHeight(
                        context, 24), // Adjust size if needed
                    width: getProportionalWidth(context, 24),
                  ),
                ),
              Text(
                label,
                style: TextStyle(
                    color: textColor,
                    fontFamily: kInriaSansFont,
                    fontSize: getProportionalWidth(context, 20)),
              ),
              SizedBox(
                width: 8.w,
              ),
              arrowForSplash != null
                  ? SvgPicture.asset(
                      arrowForSplash!,
                      height: 18.h,
                      width: 18.w,
                    )
                  : SizedBox(
                      height: 18.h,
                      width: 18.w,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
