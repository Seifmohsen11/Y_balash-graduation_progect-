import 'package:flutter/material.dart';
import 'package:y_balash/Features/authentication/presentation/views/widgets/custom_text_field.dart';
import 'package:y_balash/Features/authentication/presentation/views/widgets/text_field_title.dart';

class TitleAndTextField extends StatelessWidget {
  const TitleAndTextField({
    super.key,
    required this.title,
    required this.hintText,
    this.onChange,
  });
  final String title;
  final String hintText;
  final Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        TitleOfTextField(
          title: title,
        ),
        SizedBox(
          height: screenHeight * (15 / 932),
        ),
        CustomTextFormField(
          hintText: '  $hintText',
          onChange: onChange,
        )
      ],
    );
  }
}
