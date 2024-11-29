import 'package:flutter/material.dart';
import 'package:y_balash/Features/authentication/presentation/views/widgets/otp_verification_view_body.dart';

class OtpVerificationView extends StatelessWidget {
  const OtpVerificationView({super.key});
  static String id = "OtpVerificationView";
  @override
  Widget build(BuildContext context) {
    return OtpVerificationViewBody();
  }
}
