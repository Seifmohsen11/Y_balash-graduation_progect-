import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:y_balash/core/constants/constants.dart';

class TitleOfSectionAndSeeAll extends StatelessWidget {
  const TitleOfSectionAndSeeAll(
      {super.key,
      required this.screenHeight,
      required this.screenWidth,
      required this.label,
      required this.onTap,
      this.imageIcon});
  final double screenHeight;
  final double screenWidth;
  final String label;
  final String? imageIcon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * (38 / 932),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Text(
                  label,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: kTextFieldAndButtomColor,
                      fontFamily: kAbyssinicaSIL,
                      fontSize: screenHeight * (24 / 932)),
                ),
                if (imageIcon != null)
                  Padding(
                    padding: EdgeInsets.only(left: 6.w),
                    child: SvgPicture.asset(imageIcon!, height: 20),
                  ),
              ],
            ),
          ),
          TextButton(
            onPressed: onTap,
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            child: Text(
              "See all",
              style: TextStyle(
                  color: kTextFieldAndButtomColor,
                  fontFamily: kAbyssinicaSIL,
                  fontSize: screenWidth * (16 / 430)),
            ),
          )
        ],
      ),
    );
  }
}
