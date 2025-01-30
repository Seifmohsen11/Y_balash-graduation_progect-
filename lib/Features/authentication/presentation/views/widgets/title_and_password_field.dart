import 'package:flutter/material.dart';
import 'package:y_balash/Features/authentication/presentation/views/widgets/custom_password_field.dart';
import 'package:y_balash/Features/authentication/presentation/views/widgets/text_field_title.dart';

class TitleAndPasswordField extends StatelessWidget {
  const TitleAndPasswordField({
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
        CustomPasswordField(
          hintText: '  $hintText',
          onChange: onChange,
        )
      ],
    );
  }
}
