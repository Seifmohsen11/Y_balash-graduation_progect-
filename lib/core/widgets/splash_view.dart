import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y_balash/Features/authentication/presentation/views/sign_up_view.dart';
import 'package:y_balash/Features/home/presentation/views/main_view.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/helper/is_token_expired.dart';
import 'package:y_balash/core/helper/shared_pref_helper.dart';
import 'package:y_balash/core/widgets/custom_buttom.dart';
import 'package:y_balash/core/widgets/logo_name.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static String id = "splashScreen";

  @override
  SplashViewState createState() => SplashViewState();
}

class SplashViewState extends State<SplashView> {
  bool showButton = false;

  double getProportionalHeight(BuildContext context, double originalHeight) {
    return (originalHeight / 932) * MediaQuery.of(context).size.height;
  }

  double getProportionalWidth(BuildContext context, double originalWidth) {
    return (originalWidth / 430) * MediaQuery.of(context).size.width;
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      setState(() {
        showButton = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 57.h),
          child: Column(
            children: [
              Image.asset(
                'assets/images/shoping.png',
                width: 386.w,
                height: 452.h,
              ),
              LogoName(
                height: 109.h,
                width: 344.w,
              ),
              Text(
                "Your Go-To for Discounted",
                style: TextStyle(
                  fontSize: 20.sp,
                  color: const Color(0xffFFC433),
                  fontFamily: kInriaSansFont,
                ),
              ),
              Text(
                "Freshness",
                style: TextStyle(
                  fontSize: 20.sp,
                  color: const Color(0xffFFC433),
                  fontFamily: kInriaSansFont,
                ),
              ),
              const Spacer(),
              if (showButton)
                CustomButtom(
                  label: 'Get started for free',
                  arrowForSplash: true,
                  height: getProportionalHeight(context, 58),
                  width: getProportionalWidth(context, 232),
                  backgorundColor: kTextFieldAndButtomColor,
                  textColor: Colors.white,
                  borderColor: kTextFieldAndButtomColor,
                  onTap: () async {
                    String? token = await SharedPrefHelper.getToken();
                    print('token is $token');

                    bool isValid = token != null && !isTokenExpired(token);

                    String targetRoute = isValid ? MainView.id : SignUpView.id;
                    Navigator.pushReplacementNamed(context, targetRoute);
                  },
                  borderRadiusSize: 50.w,
                ),
              SizedBox(
                height: 33.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
