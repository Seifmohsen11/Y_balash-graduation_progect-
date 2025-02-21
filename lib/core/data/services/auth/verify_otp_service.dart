import 'package:y_balash/core/helper/api.dart';

final apiService = ApiService(baseUrl: 'https://y-balash.vercel.app/');

Future<void> verifyOTP(
  String otp,
) async {
  final otpData = {
    'otp': otp,
  };

  try {
    final response = await apiService.post(
      endpoint: 'verify-otp',
      body: otpData,
    );
    print('verify Successful: $response');
  } catch (error) {
    print('verify Failed: $error');
    throw error;
  }
}
