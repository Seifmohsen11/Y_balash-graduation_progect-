import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y_balash/Features/authentication/presentation/views/forget_password_view.dart';
import 'package:y_balash/Features/authentication/presentation/views/sign_up_view.dart';
import 'package:y_balash/Features/authentication/presentation/views/widgets/title_and_password_field.dart';
import 'package:y_balash/Features/authentication/presentation/views/widgets/title_and_text_field.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/widgets/custom_buttom.dart';
import 'package:y_balash/core/widgets/custom_text_divider.dart';
import 'package:y_balash/core/widgets/logo_name.dart';
import 'package:y_balash/core/widgets/text_under_buttom.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 57.h,
            ),
            const LogoName(),
            SizedBox(
              height: 37.h,
            ),
            const TitleAndTextField(
              title: 'Email address',
              hintText: 'Enter your email',
            ),
            SizedBox(
              height: 15.h,
            ),
            const TitleAndPasswordField(
              title: 'Password',
              hintText: 'Enter your password',
            ),
            SizedBox(
              height: 39.h,
            ),
            Padding(
              padding: EdgeInsets.only(right: 30.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.popAndPushNamed(context, ForgetPasswordView.id);
                    },
                    child: const Text(
                      "Forget Password ?",
                      style: TextStyle(
                          fontFamily: kIneraFont,
                          fontWeight: FontWeight.w400,
                          color: kmainTextColor,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            CustomButtom(
              height: 58.h,
              width: 153.w,
              label: 'Login',
              backgorundColor: kTextFieldAndButtomColor,
              textColor: Colors.white,
              borderColor: kTextFieldAndButtomColor,
              onTap: () {},
            ),
            SizedBox(
              height: 22.h,
            ),
            TextUnderButtom(
              firstText: "Doesn't have an account ?",
              secondText: 'sign up',
              onTap: () {
                Navigator.popAndPushNamed(context, SignUpView.id);
              },
            ),
            SizedBox(
              height: 8.h,
            ),
            const CusttomTextDivider(
              text: "or",
            ),
            SizedBox(
              height: 52.h,
            ),
            CustomButtom(
              height: 46.h,
              width: 292.w,
              label: 'Login with google',
              image: 'assets/icons/google.png',
              backgorundColor: Colors.transparent,
              textColor: Colors.black,
              borderColor: kmainTextColor,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
