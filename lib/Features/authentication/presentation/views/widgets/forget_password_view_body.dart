import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y_balash/Features/authentication/presentation/views/Login_view.dart';
import 'package:y_balash/Features/authentication/presentation/views/otp_verification_view.dart';
import 'package:y_balash/Features/authentication/presentation/views/sign_up_view.dart';
import 'package:y_balash/Features/authentication/presentation/views/widgets/title_and_text_field.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/widgets/custom_buttom.dart';
import 'package:y_balash/core/widgets/text_under_buttom.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  String? email;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 108.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Forget Password',
                    style: TextStyle(
                      color: kTextFieldAndButtomColor,
                      fontFamily: kIneraFont,
                      fontWeight: FontWeight.w400,
                      fontSize: 32.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 63.h,
              ),
              TitleAndTextField(
                title: 'Email',
                hintText: 'Enter your email',
                onChange: (data) {
                  email = data;
                },
              ),
              SizedBox(
                height: 67.h,
              ),
              CustomButtom(
                  height: 58.h,
                  width: 216.w,
                  label: 'Send OTP',
                  backgorundColor: kTextFieldAndButtomColor,
                  textColor: Colors.white,
                  borderColor: kTextFieldAndButtomColor,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      print("Email: $email");
                      Navigator.popAndPushNamed(
                          context, OtpVerificationView.id);
                    }
                  }),
              SizedBox(
                height: 22.h,
              ),
              TextUnderButtom(
                firstText: "New here ?",
                secondText: 'sign up',
                onTap: () {
                  Navigator.popAndPushNamed(context, SignUpView.id);
                },
              ),
              SizedBox(
                height: 18.h,
              ),
              TextUnderButtom(
                firstText: "Remembered my password .",
                secondText: 'Login',
                onTap: () {
                  Navigator.popAndPushNamed(context, LoginView.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
