import 'package:y_balash/core/helper/api.dart';

final apiService = ApiService(baseUrl: 'https://y-balash.vercel.app/');

Future<void> sendOTP(
  String email,
) async {
  final otpData = {
    'email': email,
  };

  try {
    final response = await apiService.post(
      endpoint: 'send-otp',
      body: otpData,
    );
    print('Send Success: $response');
  } catch (error) {
    print('Send Failed: $error');
    throw error;
  }
}
