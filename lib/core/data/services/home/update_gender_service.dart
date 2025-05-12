import 'package:y_balash/core/helper/api.dart';
import 'package:y_balash/core/helper/shared_pref_helper.dart';

final apiService = ApiService(baseUrl: 'https://y-balash.vercel.app/api/');

Future<void> updateUserGender({required String gender}) async {
  try {
    String? token = await SharedPrefHelper.getToken();
    if (token == null) {
      print("Error: No token found. User might not be logged in.");
      return;
    }

    final response = await apiService.put(
      endpoint: 'user/update-gender',
      body: {'gender': gender},
      token: token,
    );

    print('Gender updated successfully: $response');
  } catch (error) {
    print('Failed to update gender: $error');
    throw error;
  }
}
