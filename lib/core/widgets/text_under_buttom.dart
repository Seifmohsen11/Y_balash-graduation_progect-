import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y_balash/core/constants/constants.dart';

class TextUnderButtom extends StatelessWidget {
  const TextUnderButtom(
      {super.key,
      required this.firstText,
      this.secondText,
      required this.onTap});

  final String firstText;
  final String? secondText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          firstText,
          style: const TextStyle(
            color: kmainTextColor,
            fontFamily: kIneraFont,
          ),
        ),
        if (secondText != null)
          Padding(
            padding: EdgeInsets.only(left: 4.w),
            child: GestureDetector(
              onTap: onTap,
              child: Text(
                secondText!,
                style: const TextStyle(
                    color: kmainTextColor,
                    fontFamily: kIneraFont,
                    decoration: TextDecoration.underline),
              ),
            ),
          ),
      ],
    );
  }
}
