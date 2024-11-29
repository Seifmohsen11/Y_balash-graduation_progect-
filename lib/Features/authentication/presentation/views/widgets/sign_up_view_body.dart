import 'package:flutter/material.dart';
import 'package:y_balash/Features/authentication/presentation/views/Login_view.dart';
import 'package:y_balash/Features/authentication/presentation/views/widgets/title_and_password_field.dart';
import 'package:y_balash/Features/authentication/presentation/views/widgets/title_and_text_field.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/widgets/custom_buttom.dart';
import 'package:y_balash/core/widgets/custom_text_divider.dart';
import 'package:y_balash/core/widgets/logo_name.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y_balash/core/widgets/text_under_buttom.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

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
            const TitleAndTextField(
              title: 'Phone Number',
              hintText: 'Enter your phone number',
            ),
            SizedBox(
              height: 15.h,
            ),
            const TitleAndPasswordField(
              title: 'Password',
              hintText: 'Enter your password',
            ),
            SizedBox(
              height: 15.h,
            ),
            const TitleAndPasswordField(
              title: 'Confirm Password',
              hintText: 'Enter your password',
            ),
            SizedBox(
              height: 37.h,
            ),
            CustomButtom(
              height: 58.h,
              width: 191.w,
              label: 'Sign Up',
              backgorundColor: kTextFieldAndButtomColor,
              textColor: Colors.white,
              borderColor: kTextFieldAndButtomColor,
              onTap: () {},
            ),
            SizedBox(
              height: 15.h,
            ),
            TextUnderButtom(
              onTap: () {
                Navigator.popAndPushNamed(context, LoginView.id);
              },
              firstText: 'Already have an account ?',
              secondText: 'Login',
            ),
            const CusttomTextDivider(
              text: "or",
            ),
            SizedBox(
              height: 59.h,
            ),
            CustomButtom(
              height: 46.h,
              width: 292.w,
              label: 'Sign up with google',
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
