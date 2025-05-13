import 'package:y_balash/core/helper/api.dart';
import 'package:y_balash/core/helper/shared_pref_helper.dart';

final apiService = ApiService(baseUrl: 'https://y-balash.vercel.app/api/');

Future<void> updateUserBirthday({required String birthday}) async {
  try {
    String? token = await SharedPrefHelper.getToken();
    if (token == null) {
      print("Error: No token found. User might not be logged in.");
      return;
    }

    final response = await apiService.put(
      endpoint: 'user/update-birthday',
      body: {'birthday': birthday},
      token: token,
    );

    print('Birthday updated successfully: $response');
  } catch (error) {
    print('Failed to update birthday: $error');
    throw error;
  }
}
