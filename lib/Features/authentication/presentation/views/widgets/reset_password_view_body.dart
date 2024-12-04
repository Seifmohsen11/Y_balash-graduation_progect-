import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y_balash/Features/authentication/presentation/views/widgets/title_and_password_field.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/widgets/custom_buttom.dart';

class ResetPasswordViewBody extends StatefulWidget {
  const ResetPasswordViewBody({super.key});

  @override
  State<ResetPasswordViewBody> createState() => _ResetPasswordViewBodyState();
}

class _ResetPasswordViewBodyState extends State<ResetPasswordViewBody> {
  String? newPassword, confirmNewPassword;
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
                    'Reset Password',
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
                height: 42.h,
              ),
              TitleAndPasswordField(
                title: 'New Password',
                hintText: 'Enter your new password',
                onChange: (data) {
                  newPassword = data;
                },
              ),
              SizedBox(
                height: 15.h,
              ),
              TitleAndPasswordField(
                title: 'Confirm New Password',
                hintText: 'Enter your new password',
                onChange: (data) {
                  confirmNewPassword = data;
                },
              ),
              SizedBox(
                height: 36.h,
              ),
              CustomButtom(
                  height: 58.h,
                  width: 216.w,
                  label: 'Reset',
                  backgorundColor: kTextFieldAndButtomColor,
                  textColor: Colors.white,
                  borderColor: kTextFieldAndButtomColor,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      print("new Password: $newPassword");
                      print("Confirm new Password: $confirmNewPassword");
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
