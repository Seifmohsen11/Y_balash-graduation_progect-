import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:y_balash/Features/home/presentation/views/main_view.dart';
import 'package:y_balash/core/constants/constants.dart';

class AppBarOfChatBot extends StatelessWidget {
  const AppBarOfChatBot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85.h + MediaQuery.of(context).padding.top,
      width: double.infinity,
      color: kTextFieldAndButtomColor,
      child: Padding(
        padding: EdgeInsets.only(top: 36.h),
        child: Row(
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.popAndPushNamed(context, MainView.id);
              },
            ),
            SvgPicture.asset(
              'assets/icons/chatbotLoge.svg',
              height: 50.h,
              width: 50.h,
              fit: BoxFit.fill,
            ),
            SizedBox(
              width: 10.w,
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Chatbot',
                    style: TextStyle(
                      fontSize: 24.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: const Color(0xFF43EE7D),
                        size: 14.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 3.w),
                        child: Text(
                          'Online',
                          style: TextStyle(
                              color: const Color(0xFF43EE7D), fontSize: 16.sp),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
