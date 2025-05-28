import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:y_balash/core/constants/constants.dart';

class AppBarOfLocationView extends StatelessWidget {
  const AppBarOfLocationView({
    super.key,
    required this.iconImage,
    required this.title,
    required this.onPressed,
  });

  final String iconImage;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
            onPressed: () {
              onPressed();
            },
            icon: SvgPicture.asset(iconImage)),
        Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: Text(
            title,
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                fontFamily: kPoppins,
                color: kTextFieldAndButtomColor),
          ),
        ),
      ],
    );
  }
}
