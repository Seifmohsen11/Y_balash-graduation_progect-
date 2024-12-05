import 'package:y_balash/core/helper/api.dart';

final apiService = ApiService(baseUrl: 'https://y-balash.vercel.app/');

Future<void> resetPassword(
  String newPassword,
  String confirmNewPassword,
) async {
  final resetPasswordData = {
    'newPassword': newPassword,
    'confirmNewPassword': confirmNewPassword,
  };

  try {
    final response = await apiService.post(
      endpoint: 'reset-password',
      body: resetPasswordData,
    );
    print('Reset Password Successful: $response');
  } catch (error) {
    print('Reset Password Failed: $error');
    throw error;
  }
}
