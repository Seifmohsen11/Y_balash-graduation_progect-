import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/sectionsViews/back_arrow.dart';
import 'package:y_balash/core/constants/constants.dart';

class UpdateNameView extends StatelessWidget {
  const UpdateNameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: Column(
          children: [
            const BackArrow(),
            SizedBox(
              height: 40.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: Column(
                children: [
                  Text(
                    'First Name',
                    style: TextStyle(
                      color: kTextFieldAndButtomColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
