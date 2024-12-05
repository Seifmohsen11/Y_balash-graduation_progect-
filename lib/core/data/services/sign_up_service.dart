import 'package:y_balash/core/helper/api.dart';

final apiService = ApiService(baseUrl: 'https://y-balash.vercel.app/api/');

Future<void> signUpUser(
    String email, String phone, String password, String confirmPassword) async {
  final signupData = {
    'email': email,
    'phone': phone,
    'password': password,
    'confirmPassword': confirmPassword,
  };

  try {
    final response = await apiService.post(
      endpoint: 'auth/signup',
      body: signupData,
    );
    print('Signup Success: $response');
  } catch (error) {
    print('Signup Failed: $error');
    throw error;
  }
}
