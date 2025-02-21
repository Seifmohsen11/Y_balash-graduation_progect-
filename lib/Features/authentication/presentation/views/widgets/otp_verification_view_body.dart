import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 108.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'OTP Verification',
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
              height: 17.h,
            ),
            const TextUnderButtom(
              firstText: "Enter OTP code sent to ****@gmail.com",
            ),
            SizedBox(
              height: 31.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
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
                textStyle: TextStyle(fontSize: 18.sp, color: Colors.black),
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(20.r),
                  borderWidth: 2,
                  fieldHeight: 70.h,
                  fieldWidth: 54.w,
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
              height: 39.h,
            ),
            _isLoading
                ? const CircularProgressIndicator(
                    color: kTextFieldAndButtomColor,
                  )
                : CustomButtom(
                    height: 58.h,
                    width: 216.w,
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
                          showSnackBar(context, error.toString());
                        } finally {
                          setState(() {
                            _isLoading = false;
                          });
                        }
                      }
                    },
                  ),
            SizedBox(
              height: 29.h,
            ),
            const TextUnderButtom(
              firstText: "Didn't receive OTP code ?",
            ),
            SizedBox(
              height: 7.h,
            ),
            TextUnderButtom(
              firstText: "",
              secondText: 'Resend Code',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
