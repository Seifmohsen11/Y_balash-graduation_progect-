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

class SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController _imageController;
  late AnimationController _logoController;
  late AnimationController _textController;
  late Animation<double> _imageAnimation;
  late Animation<double> _logoAnimation;
  late Animation<double> _textAnimation;

  bool showButton = false;

  @override
  void initState() {
    super.initState();

    _imageController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _imageAnimation = Tween<double>(begin: 0, end: 1).animate(_imageController);
    _logoAnimation = Tween<double>(begin: 0, end: 1).animate(_logoController);
    _textAnimation = Tween<double>(begin: 0, end: 1).animate(_textController);

    _startAnimations();
  }

  Future<void> _startAnimations() async {
    await Future.delayed(const Duration(milliseconds: 400));
    _imageController.forward();
    await Future.delayed(const Duration(milliseconds: 400));
    _logoController.forward();
    await Future.delayed(const Duration(milliseconds: 400));
    _textController.forward();
    await Future.delayed(const Duration(milliseconds: 400));

    _checkTokenAndNavigate();
  }

  Future<void> _checkTokenAndNavigate() async {
    await Future.delayed(const Duration(seconds: 1));
    String? token = await SharedPrefHelper.getToken();
    bool isValid = token != null && !isTokenExpired(token);
    print('token is $token');

    if (isValid) {
      Navigator.pushReplacementNamed(context, MainView.id);
    } else {
      setState(() {
        showButton = true;
      });
    }
  }

  @override
  void dispose() {
    _imageController.dispose();
    _logoController.dispose();
    _textController.dispose();
    super.dispose();
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
              FadeTransition(
                opacity: _imageAnimation,
                child: Image.asset(
                  'assets/images/shoping.png',
                  width: 386.w,
                  height: 452.h,
                ),
              ),
              FadeTransition(
                opacity: _logoAnimation,
                child: LogoName(
                  height: 109.h,
                  width: 344.w,
                ),
              ),
              FadeTransition(
                opacity: _textAnimation,
                child: Column(
                  children: [
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
                  ],
                ),
              ),
              const Spacer(),
              if (showButton)
                CustomButtom(
                  label: 'Get started for free',
                  arrowForSplash: true,
                  height: 58.h,
                  width: 232.w,
                  backgorundColor: kTextFieldAndButtomColor,
                  textColor: Colors.white,
                  borderColor: kTextFieldAndButtomColor,
                  onTap: () async {
                    Navigator.pushReplacementNamed(context, SignUpView.id);
                  },
                  borderRadiusSize: 50.w,
                ),
              SizedBox(height: 33.h),
            ],
          ),
        ),
      ),
    );
  }
}
