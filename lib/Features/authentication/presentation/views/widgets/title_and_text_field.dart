import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y_balash/Features/authentication/presentation/views/widgets/custom_text_field.dart';
import 'package:y_balash/Features/authentication/presentation/views/widgets/text_field_title.dart';

class TitleAndTextField extends StatelessWidget {
  const TitleAndTextField(
      {super.key, required this.title, required this.hintText});
  final String title;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleOfTextField(
          title: title,
        ),
        SizedBox(
          height: 15.h,
        ),
        CustomTextField(
          hintText: '  $hintText',
        )
      ],
    );
  }
}
