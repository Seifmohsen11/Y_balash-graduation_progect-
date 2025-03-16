import 'package:flutter/material.dart';
import 'package:y_balash/Features/authentication/presentation/views/Login_view.dart';
import 'package:y_balash/Features/authentication/presentation/views/widgets/title_and_password_field.dart';
import 'package:y_balash/Features/authentication/presentation/views/widgets/title_and_text_field.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/data/services/auth/sign_up_service.dart';
import 'package:y_balash/core/helper/show_snackbar.dart';
import 'package:y_balash/core/widgets/custom_buttom.dart';
import 'package:y_balash/core/widgets/custom_text_divider.dart';
import 'package:y_balash/core/widgets/logo_name.dart';
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
              SizedBox(
                height: getProportionalHeight(context, 57),
              ),
              const LogoName(),
              SizedBox(
                height: getProportionalHeight(context, 37),
              ),
              TitleAndTextField(
                title: 'Email address',
                hintText: 'Enter your email',
                onChange: (data) {
                  email = data;
                },
              ),
              SizedBox(
                height: getProportionalHeight(context, 15),
              ),
              TitleAndTextField(
                title: 'Phone Number',
                hintText: 'Enter your phone number',
                onChange: (data) {
                  phone = data;
                },
              ),
              SizedBox(
                height: getProportionalHeight(context, 15),
              ),
              TitleAndPasswordField(
                title: 'Password',
                hintText: 'Enter your password',
                onChange: (data) {
                  password = data;
                },
              ),
              SizedBox(
                height: getProportionalHeight(context, 15),
              ),
              TitleAndPasswordField(
                title: 'Confirm Password',
                hintText: 'Enter your password',
                onChange: (data) {
                  confirmPassword = data;
                },
              ),
              SizedBox(
                height: getProportionalHeight(context, 37),
              ),
              _isLoading
                  ? const CircularProgressIndicator(
                      color: kTextFieldAndButtomColor,
                    )
                  : CustomButtom(
                      height: getProportionalHeight(context, 58),
                      width: getProportionalWidth(context, 191),
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
                height: getProportionalHeight(context, 15),
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
                height: getProportionalHeight(context, 48),
              ),
              CustomButtom(
                height: getProportionalHeight(context, 46),
                width: getProportionalWidth(context, 292),
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
