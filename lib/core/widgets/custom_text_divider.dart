import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y_balash/core/constants/constants.dart';

class CusttomTextDivider extends StatelessWidget {
  final String text;
  final Color dividerColor;
  final double thickness;
  final double textPadding;

  const CusttomTextDivider({
    super.key,
    required this.text,
    this.dividerColor = kmainTextColor,
    this.thickness = .5,
    this.textPadding = 2.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: dividerColor,
            thickness: thickness,
            indent: 22.w,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: textPadding),
          child: Text(
            text,
            style: TextStyle(
                color: dividerColor,
                fontWeight: FontWeight.w400,
                fontFamily: kIneraFont),
          ),
        ),
        Expanded(
          child: Divider(
            color: dividerColor,
            thickness: thickness,
            endIndent: 22.w,
          ),
        ),
      ],
    );
  }
}
