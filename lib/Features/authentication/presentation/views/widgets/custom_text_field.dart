import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y_balash/core/constants/constants.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.icon,
    this.onChange,
  });

  final String hintText;
  final IconButton? icon;
  final Function(String)? onChange;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: SizedBox(
        height: 55.h,
        child: TextFormField(
          validator: (data) {
            if (data!.isEmpty) {
              return "field is required";
            }
            return null;
          },
          onChanged: widget.onChange,
          decoration: InputDecoration(
            suffixIcon: widget.icon,
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
                borderSide: const BorderSide(
                  color: kTextFieldAndButtomColor,
                )),
          ),
        ),
      ),
    );
  }
}
