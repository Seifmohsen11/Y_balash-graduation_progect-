import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y_balash/Features/authentication/presentation/views/widgets/custom_text_field.dart';
import 'package:y_balash/core/constants/constants.dart';

class TitelAndTextFormFieldOfUserData extends StatelessWidget {
  const TitelAndTextFormFieldOfUserData({
    super.key,
    required this.titel,
    required this.hintText,
  });
  final String titel;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 14.w),
          child: Text(
            titel,
            style: TextStyle(
              color: kTextFieldAndButtomColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        CustomTextFormField(
          hintText: hintText,
          backgroundColor: Colors.white,
          borderColor: Colors.white,
          borderRadius: 8,
        )
      ],
    );
  }
}
