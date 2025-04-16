import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
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
import 'package:y_balash/Features/home/presentation/views/payment_method_view.dart';
import 'package:y_balash/Features/home/presentation/views/search_view.dart';
import 'package:y_balash/core/helper/is_token_expired.dart';
import 'package:y_balash/core/helper/shared_pref_helper.dart';
import 'package:y_balash/core/widgets/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Stripe.publishableKey =
      'pk_test_51Qxr5tGvLVRZ2IJZdi79skSIRf8iMJgmZVMVTtENkPQCTrbR1Jlo1ljW0whTogd7DNZqlbyKcbTTEQEioxfVSGbi00t1fq1DBN';

  // Check if the token exists in SharedPreferences
  String? token = await SharedPrefHelper.getToken();
  print('token is $token');

  bool isValid = token != null && !isTokenExpired(token);

  // Based on token presence, decide the initial route
  String initialRoute = isValid ? MainView.id : SplashView.id;

  runApp(DevicePreview(
      enabled: true,
      builder: (context) => YBalashApp(
            initialRoute: initialRoute,
          )));
}

class YBalashApp extends StatelessWidget {
  final String initialRoute;

  const YBalashApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashView.id: (context) => const SplashView(),
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
        PaymentMethodView.id: (context) => const PaymentMethodView(),
      },
      initialRoute: initialRoute,
    );
  }
}
