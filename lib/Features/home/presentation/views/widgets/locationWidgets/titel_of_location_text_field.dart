import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y_balash/core/constants/constants.dart';

class TitleOfLocationTextField extends StatelessWidget {
  const TitleOfLocationTextField(
      {super.key, required this.title, this.fontSize});
  final String title;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 14.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: kPoppins,
              fontSize: 18.sp,
              color: kTextFieldAndButtomColor,
            ),
          ),
        ],
      ),
    );
  }
}
