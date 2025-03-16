import 'package:flutter/material.dart';
import 'package:y_balash/core/constants/constants.dart';

class TextUnderButtom extends StatelessWidget {
  const TextUnderButtom(
      {super.key, required this.firstText, this.secondText, this.onTap});

  final String firstText;
  final String? secondText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    double getProportionalWidth(BuildContext context, double originalWidth) {
      return (originalWidth / 430) * MediaQuery.of(context).size.width;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          firstText,
          style: const TextStyle(
            color: kmainTextColor,
            fontFamily: kIneraFont,
          ),
        ),
        if (secondText != null)
          Padding(
            padding: EdgeInsets.only(left: getProportionalWidth(context, 4)),
            child: GestureDetector(
              onTap: onTap,
              child: Text(
                secondText!,
                style: const TextStyle(
                    color: kmainTextColor,
                    fontFamily: kIneraFont,
                    decoration: TextDecoration.underline),
              ),
            ),
          ),
      ],
    );
  }
}
