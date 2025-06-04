import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:y_balash/core/constants/constants.dart';

class AppBarOfCafeView extends StatelessWidget {
  const AppBarOfCafeView({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.w),
      child: SafeArea(
          bottom: false,
          child: Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: SvgPicture.asset('assets/icons/arrow.svg'),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 36.sp,
                      fontFamily: kAbyssinicaSIL,
                      color: kTextFieldAndButtomColor),
                ),
              ],
            ),
          )),
    );
  }
}
