import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y_balash/Features/authentication/presentation/views/login_view.dart';
import 'package:y_balash/Features/authentication/presentation/views/widgets/title_and_password_field.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/data/services/reset_password_service.dart';
import 'package:y_balash/core/helper/show_snackbar.dart';
import 'package:y_balash/core/widgets/custom_buttom.dart';

class ResetPasswordViewBody extends StatefulWidget {
  const ResetPasswordViewBody({super.key});

  @override
  State<ResetPasswordViewBody> createState() => _ResetPasswordViewBodyState();
}

class _ResetPasswordViewBodyState extends State<ResetPasswordViewBody> {
  String? newPassword, confirmNewPassword;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

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
              _isLoading
                  ? const CircularProgressIndicator(
                      color: kTextFieldAndButtomColor,
                    )
                  : CustomButtom(
                      height: 58.h,
                      width: 216.w,
                      label: 'Reset',
                      backgorundColor: kTextFieldAndButtomColor,
                      textColor: Colors.white,
                      borderColor: kTextFieldAndButtomColor,
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _isLoading = true;
                          });
                          try {
                            await resetPassword(
                                newPassword!, confirmNewPassword!);
                            showSnackBar(context, 'Reseted Successful!',
                                backgroundColor: Colors.green);
                            Navigator.popAndPushNamed(context, LoginView.id);
                          } catch (error) {
                            showSnackBar(context, error.toString());
                          } finally {
                            setState(() {
                              _isLoading = false;
                            });
                          }
                        } else {
                          showSnackBar(
                              context, 'Please fill all required fields.');
                        }
                      }),
            ],
          ),
        ),
      ),
    );
  }
}
