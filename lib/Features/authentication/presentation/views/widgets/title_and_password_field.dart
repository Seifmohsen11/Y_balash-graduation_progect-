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

  double getProportionalHeight(BuildContext context, double originalHeight) {
    return (originalHeight / 932) * MediaQuery.of(context).size.height;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleOfTextField(
          title: title,
        ),
        SizedBox(
          height: getProportionalHeight(context, 15),
        ),
        CustomPasswordField(
          hintText: '  $hintText',
          onChange: onChange,
        )
      ],
    );
  }
}
