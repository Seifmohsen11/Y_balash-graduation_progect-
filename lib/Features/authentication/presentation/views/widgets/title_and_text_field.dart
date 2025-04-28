import 'package:flutter/material.dart';
import 'package:y_balash/Features/authentication/presentation/views/widgets/custom_text_field.dart';
import 'package:y_balash/Features/authentication/presentation/views/widgets/text_field_title.dart';

class TitleAndTextField extends StatelessWidget {
  const TitleAndTextField({
    super.key,
    required this.title,
    required this.hintText,
    this.onChange,
    required this.backgroundColor,
    required this.borderColor,
    this.titleFontSize,
    this.spaceBetweenTitleAndField,
    this.horizontalPaddingOfField,
  });

  final String title;
  final String hintText;
  final Function(String)? onChange;
  final Color backgroundColor;
  final Color borderColor;
  final double? titleFontSize;
  final double? spaceBetweenTitleAndField;
  final double? horizontalPaddingOfField;

  double getProportionalHeight(BuildContext context, double originalHeight) {
    return (originalHeight / 932) * MediaQuery.of(context).size.height;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleOfTextField(
          title: title,
          fontSize: titleFontSize,
        ),
        SizedBox(
            height: getProportionalHeight(
                context, spaceBetweenTitleAndField ?? 15)),
        CustomTextFormField(
          hintText: '  $hintText',
          onChange: onChange,
          backgroundColor: backgroundColor,
          borderColor: borderColor,
          horizontalPadding: horizontalPaddingOfField,
          borderRadius: 50,
        ),
      ],
    );
  }
}
