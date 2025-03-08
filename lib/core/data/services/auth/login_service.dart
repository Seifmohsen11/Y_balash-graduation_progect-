import 'package:y_balash/core/helper/api.dart';
import 'package:y_balash/core/helper/shared_pref_helper.dart';

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
    await SharedPrefHelper.saveToken(response['token']);
  } catch (error) {
    print('Login Failed: $error');
    throw error;
  }
}
