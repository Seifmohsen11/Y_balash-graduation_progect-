import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y_balash/core/constants/constants.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({super.key, required this.hintText});

  final String hintText;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool secureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: SizedBox(
        height: 55.h,
        child: TextField(
          obscureText: secureText, // This controls the visibility of the text
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  secureText = !secureText; // Toggle the secureText value
                });
              },
              icon: Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                    Color(0xff8A8A8A), // Set the color to red
                    BlendMode.srcIn, // Apply the color filter
                  ),
                  child: Image.asset(
                    secureText
                        ? 'assets/icons/closedEyeIcon.png' // Icon when password is hidden
                        : 'assets/icons/openEyeIcon.png', // Icon when password is visible
                    width: 24.w, // Adjust the icon size if needed
                    height: 24.h,
                  ),
                ),
              ),
            ),
            hintText: widget.hintText,
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
