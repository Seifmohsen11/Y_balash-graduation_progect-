import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y_balash/Features/authentication/presentation/views/Login_view.dart';
import 'package:y_balash/Features/authentication/presentation/views/forget_password_view.dart';
import 'package:y_balash/Features/authentication/presentation/views/otp_verification_view.dart';
import 'package:y_balash/Features/authentication/presentation/views/reset_password_view.dart';
import 'package:y_balash/Features/authentication/presentation/views/sign_up_view.dart';
import 'package:y_balash/Features/home/presentation/views/account_view.dart';
import 'package:y_balash/Features/home/presentation/views/cart_view.dart';
import 'package:y_balash/Features/home/presentation/views/chat_bot_view.dart';
import 'package:y_balash/Features/home/presentation/views/favourite_view.dart';
import 'package:y_balash/Features/home/presentation/views/home_view.dart';
import 'package:y_balash/Features/home/presentation/views/main_view.dart';
import 'package:y_balash/Features/home/presentation/views/search_view.dart';

void main() {
  runApp(
      DevicePreview(enabled: true, builder: (context) => const YBalashApp()));
}

class YBalashApp extends StatelessWidget {
  const YBalashApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:
          const Size(430, 932), // Reference design size (width x height)
      minTextAdapt: true, // Adjust text scaling
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            SignUpView.id: (context) => const SignUpView(),
            LoginView.id: (context) => const LoginView(),
            ForgetPasswordView.id: (context) => const ForgetPasswordView(),
            OtpVerificationView.id: (context) => const OtpVerificationView(),
            ResetPasswordView.id: (context) => const ResetPasswordView(),
            MainView.id: (context) => const MainView(),
            HomeView.id: (context) => const HomeView(),
            SearchView.id: (context) => const SearchView(),
            FavouriteView.id: (context) => const FavouriteView(),
            ChatPotView.id: (context) => const ChatPotView(),
            CartView.id: (context) => const CartView(),
            AccountView.id: (context) => const AccountView(),
          },
          initialRoute: SignUpView.id,
        );
      },
    );
  }
}
