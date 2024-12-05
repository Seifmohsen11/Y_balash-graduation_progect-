import 'package:y_balash/core/helper/api.dart';

final apiService = ApiService(baseUrl: 'https://y-balash.vercel.app/api/');

Future<void> loginUser(
  String email,
  String password,
) async {
  final loginData = {
    'email': email,
    'password': password,
  };

  try {
    final response = await apiService.post(
      endpoint: 'auth/login',
      body: loginData,
    );
    print('Login Success: $response');
  } catch (error) {
    print('Login Failed: $error');
    throw error;
  }
}
