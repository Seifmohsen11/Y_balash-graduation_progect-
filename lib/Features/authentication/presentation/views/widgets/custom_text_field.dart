import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y_balash/core/constants/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hintText, this.icon});

  final String hintText;
  final IconButton? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: SizedBox(
        height: 55.h,
        child: TextField(
          decoration: InputDecoration(
            suffixIcon: icon,
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 16.sp,
              color: kmainTextColor,
              fontFamily: kIneraFont,
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.w),
                borderSide: BorderSide(
                  width: 2.sp,
                  color: kTextFieldAndButtomColor,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.w),
                borderSide: const BorderSide(
                  color: kTextFieldAndButtomColor,
                )),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.w),
                borderSide: BorderSide(
                  color: kTextFieldAndButtomColor,
                )),
          ),
        ),
      ),
    );
  }
}
