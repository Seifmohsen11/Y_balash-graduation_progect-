import 'package:flutter/material.dart';
import 'package:y_balash/Features/authentication/presentation/views/forget_password_view.dart';
import 'package:y_balash/Features/authentication/presentation/views/sign_up_view.dart';
import 'package:y_balash/Features/authentication/presentation/views/widgets/title_and_password_field.dart';
import 'package:y_balash/Features/authentication/presentation/views/widgets/title_and_text_field.dart';
import 'package:y_balash/Features/home/presentation/views/main_view.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/data/services/auth/login_service.dart';
import 'package:y_balash/core/helper/show_snackbar.dart';
import 'package:y_balash/core/widgets/custom_buttom.dart';
import 'package:y_balash/core/widgets/custom_text_divider.dart';
import 'package:y_balash/core/widgets/logo_name.dart';
import 'package:y_balash/core/widgets/text_under_buttom.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  String? email, password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  double getProportionalHeight(BuildContext context, double originalHeight) {
    return (originalHeight / 932) * MediaQuery.of(context).size.height;
  }

  double getProportionalWidth(BuildContext context, double originalWidth) {
    return (originalWidth / 430) * MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: getProportionalHeight(context, 57)),
              LogoName(
                height: getProportionalHeight(context, 90),
                width: getProportionalWidth(context, 253),
              ),
              SizedBox(height: getProportionalHeight(context, 37)),
              TitleAndTextField(
                title: 'Email address',
                hintText: 'Enter your email',
                onChange: (data) {
                  email = data;
                },
                backgroundColor: kPrimaryColor,
                borderColor: kTextFieldAndButtomColor,
                textFormFieldBorderRadius: 50,
              ),
              SizedBox(height: getProportionalHeight(context, 15)),
              TitleAndPasswordField(
                title: 'Password',
                hintText: 'Enter your password',
                onChange: (data) {
                  password = data;
                },
              ),
              SizedBox(height: getProportionalHeight(context, 39)),
              Padding(
                padding:
                    EdgeInsets.only(right: getProportionalWidth(context, 30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.popAndPushNamed(
                            context, ForgetPasswordView.id);
                      },
                      child: const Text(
                        "Forget Password ?",
                        style: TextStyle(
                          fontFamily: kInriaSansFont,
                          fontWeight: FontWeight.w400,
                          color: kmainTextColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: getProportionalHeight(context, 50)),
              _isLoading
                  ? const CircularProgressIndicator(
                      color: kTextFieldAndButtomColor)
                  : CustomButtom(
                      height: getProportionalHeight(context, 58),
                      width: getProportionalWidth(context, 153),
                      label: 'Login',
                      backgorundColor: kTextFieldAndButtomColor,
                      textColor: Colors.white,
                      borderColor: kTextFieldAndButtomColor,
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _isLoading = true;
                          });
                          try {
                            await loginUser(email!, password!);
                            showSnackBar(context, 'Login Successful!',
                                backgroundColor: Colors.green);
                            Navigator.popAndPushNamed(context, MainView.id);
                          } catch (error) {
                            showSnackBar(context,
                                error.toString().replaceAll('Exception: ', ''));
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
                      borderRadiusSize: getProportionalWidth(context, 50),
                    ),
              SizedBox(height: getProportionalHeight(context, 22)),
              TextUnderButtom(
                firstText: "Doesn't have an account ?",
                secondText: 'sign up',
                onTap: () {
                  Navigator.popAndPushNamed(context, SignUpView.id);
                },
              ),
              SizedBox(height: getProportionalHeight(context, 8)),
              const CusttomTextDivider(text: "or"),
              SizedBox(height: getProportionalHeight(context, 52)),
              CustomButtom(
                height: getProportionalHeight(context, 46),
                width: getProportionalWidth(context, 292),
                label: 'Login with google',
                image: 'assets/icons/google.svg',
                backgorundColor: Colors.transparent,
                textColor: Colors.black,
                borderColor: kmainTextColor,
                onTap: () {},
                borderRadiusSize: getProportionalWidth(context, 50),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
