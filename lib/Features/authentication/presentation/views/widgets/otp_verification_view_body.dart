import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:y_balash/Features/authentication/presentation/views/forget_password_view.dart';
import 'package:y_balash/Features/authentication/presentation/views/reset_password_view.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/data/services/auth/verify_otp_service.dart';
import 'package:y_balash/core/helper/show_snackbar.dart';
import 'package:y_balash/core/widgets/custom_buttom.dart';
import 'package:y_balash/core/widgets/text_under_buttom.dart';

class OtpVerificationViewBody extends StatefulWidget {
  const OtpVerificationViewBody({super.key});

  @override
  State<OtpVerificationViewBody> createState() =>
      _OtpVerificationViewBodyState();
}

class _OtpVerificationViewBodyState extends State<OtpVerificationViewBody> {
  String otp = "";
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
        child: Column(
          children: [
            SizedBox(
              height: getProportionalHeight(context, 108),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'OTP Verification',
                  style: TextStyle(
                    color: kTextFieldAndButtomColor,
                    fontFamily: kInriaSansFont,
                    fontWeight: FontWeight.w400,
                    fontSize: getProportionalWidth(context, 32),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: getProportionalHeight(context, 17),
            ),
            const TextUnderButtom(
              firstText: "Enter OTP code sent to ****@gmail.com",
            ),
            SizedBox(
              height: getProportionalHeight(context, 31),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionalWidth(context, 18),
              ),
              child: PinCodeTextField(
                appContext: context,
                length: 6,
                cursorColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    otp = value;
                  });
                },
                keyboardType: TextInputType.number,
                textStyle: TextStyle(
                    fontSize: getProportionalWidth(context, 18),
                    color: Colors.black),
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(
                    getProportionalWidth(context, 20),
                  ),
                  borderWidth: 2,
                  fieldHeight: getProportionalHeight(context, 70),
                  fieldWidth: getProportionalWidth(context, 54),
                  activeFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  selectedFillColor: Colors.white,
                  activeColor: kTextFieldAndButtomColor,
                  inactiveColor: kTextFieldAndButtomColor,
                  selectedColor: kTextFieldAndButtomColor.withOpacity(.7),
                ),
                enableActiveFill: true,
              ),
            ),
            SizedBox(
              height: getProportionalHeight(context, 39),
            ),
            _isLoading
                ? const CircularProgressIndicator(
                    color: kTextFieldAndButtomColor,
                  )
                : CustomButtom(
                    height: getProportionalHeight(context, 58),
                    width: getProportionalWidth(context, 216),
                    label: 'Verify & proceed',
                    backgorundColor: kTextFieldAndButtomColor,
                    textColor: Colors.white,
                    borderColor: kTextFieldAndButtomColor,
                    onTap: () async {
                      if (otp.isEmpty || otp.length < 6) {
                        showSnackBar(
                          context,
                          'Please enter a valid OTP code.',
                        );
                      } else {
                        setState(() {
                          _isLoading = true;
                        });
                        try {
                          await verifyOTP(otp);
                          showSnackBar(context, 'Verified Successful!',
                              backgroundColor: Colors.green);
                          Navigator.popAndPushNamed(
                              context, ResetPasswordView.id);
                        } catch (error) {
                          showSnackBar(context,
                              error.toString().replaceAll('Exception: ', ''));
                        } finally {
                          setState(() {
                            _isLoading = false;
                          });
                        }
                      }
                    },
                    borderRadiusSize: getProportionalWidth(context, 50),
                  ),
            SizedBox(
              height: getProportionalHeight(context, 29),
            ),
            const TextUnderButtom(
              firstText: "Didn't receive OTP code ?",
            ),
            SizedBox(
              height: getProportionalHeight(context, 7),
            ),
            TextUnderButtom(
              firstText: "",
              secondText: 'Resend Code',
              onTap: () {
                Navigator.pushNamed(context, ForgetPasswordView.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
