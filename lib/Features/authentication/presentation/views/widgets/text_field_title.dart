import 'package:flutter/material.dart';
import 'package:y_balash/core/constants/constants.dart';

class TitleOfTextField extends StatelessWidget {
  const TitleOfTextField({super.key, required this.title, this.fontSize});
  final String title;
  final double? fontSize;

  double getProportionalWidth(BuildContext context, double originalWidth) {
    return (originalWidth / 430) * MediaQuery.of(context).size.width;
  }

  double getProportionalHeight(BuildContext context, double originalHeight) {
    return (originalHeight / 932) * MediaQuery.of(context).size.height;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: getProportionalWidth(context, 16)),
        SizedBox(
          height: getProportionalHeight(context, 29),
          child: Text(
            title,
            style: TextStyle(
              fontFamily: kInriaSansFont,
              fontWeight: FontWeight.w400,
              fontSize: getProportionalWidth(context, fontSize ?? 24),
              color: kTextFieldAndButtomColor,
            ),
          ),
        ),
      ],
    );
  }
}
