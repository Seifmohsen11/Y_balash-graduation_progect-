import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y_balash/core/constants/constants.dart';

class TitleOfTextField extends StatelessWidget {
  const TitleOfTextField({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 16.w,
        ),
        SizedBox(
          height: 29.h,
          child: Text(
            title,
            style: TextStyle(
                fontFamily: kIneraFont,
                fontWeight: FontWeight.w400,
                fontSize: 24.sp,
                color: kTextFieldAndButtomColor),
          ),
        ),
      ],
    );
  }
}
