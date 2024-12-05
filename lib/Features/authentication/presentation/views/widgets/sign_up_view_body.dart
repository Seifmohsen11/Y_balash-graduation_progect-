import 'package:flutter/material.dart';
import 'package:y_balash/Features/authentication/presentation/views/Login_view.dart';
import 'package:y_balash/Features/authentication/presentation/views/widgets/title_and_password_field.dart';
import 'package:y_balash/Features/authentication/presentation/views/widgets/title_and_text_field.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/data/services/sign_up_service.dart';
import 'package:y_balash/core/helper/show_snackbar.dart';
import 'package:y_balash/core/widgets/custom_buttom.dart';
import 'package:y_balash/core/widgets/custom_text_divider.dart';
import 'package:y_balash/core/widgets/logo_name.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y_balash/core/widgets/text_under_buttom.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  String? email, phone, password, confirmPassword;
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
                height: 57.h,
              ),
              const LogoName(),
              SizedBox(
                height: 37.h,
              ),
              TitleAndTextField(
                title: 'Email address',
                hintText: 'Enter your email',
                onChange: (data) {
                  email = data;
                },
              ),
              SizedBox(
                height: 15.h,
              ),
              TitleAndTextField(
                title: 'Phone Number',
                hintText: 'Enter your phone number',
                onChange: (data) {
                  phone = data;
                },
              ),
              SizedBox(
                height: 15.h,
              ),
              TitleAndPasswordField(
                title: 'Password',
                hintText: 'Enter your password',
                onChange: (data) {
                  password = data;
                },
              ),
              SizedBox(
                height: 15.h,
              ),
              TitleAndPasswordField(
                title: 'Confirm Password',
                hintText: 'Enter your password',
                onChange: (data) {
                  confirmPassword = data;
                },
              ),
              SizedBox(
                height: 37.h,
              ),
              _isLoading
                  ? const CircularProgressIndicator(
                      color: kTextFieldAndButtomColor,
                    )
                  : CustomButtom(
                      height: 58.h,
                      width: 191.w,
                      label: 'Sign Up',
                      backgorundColor: kTextFieldAndButtomColor,
                      textColor: Colors.white,
                      borderColor: kTextFieldAndButtomColor,
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _isLoading = true;
                          });
                          try {
                            await signUpUser(
                                email!, phone!, password!, confirmPassword!);
                            showSnackBar(context, 'Sign-Up Successful!',
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
                      },
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
      ),
    );
  }
}
