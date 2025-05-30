import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y_balash/Features/authentication/presentation/views/widgets/custom_text_field.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/locationWidgets/titel_of_location_text_field.dart';

class TitelAndTextFieldOfLocationView extends StatelessWidget {
  final String title;
  final String hintText;
  final Icon? prefixIcon;
  final Function(String)? onChange;

  const TitelAndTextFieldOfLocationView({
    super.key,
    required this.title,
    required this.hintText,
    this.prefixIcon,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleOfLocationTextField(title: title),
        SizedBox(
          height: 8.h,
        ),
        CustomTextFormField(
            hintText: hintText,
            prefixIcon: prefixIcon,
            backgroundColor: Colors.white,
            borderColor: Colors.white,
            onChange: onChange,
            borderRadius: 8,
            contentPadding: 12),
      ],
    );
  }
}
