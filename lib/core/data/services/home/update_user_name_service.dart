import 'package:y_balash/core/helper/api.dart';
import 'package:y_balash/core/helper/shared_pref_helper.dart';

final apiService = ApiService(baseUrl: 'https://y-balash.vercel.app/api/');

Future<void> updateUserName({
  required String firstName,
  required String lastName,
}) async {
  final nameData = {
    'firstName': firstName,
    'lastName': lastName,
  };

  try {
    String? token = await SharedPrefHelper.getToken();
    if (token == null) {
      print("Error: No token found. User might not be logged in.");
      return;
    }

    final response = await apiService.put(
      endpoint: 'user/update-name',
      body: nameData,
      token: token,
    );
    print('Name updated successfully: $response');
  } catch (error) {
    print('Failed to update name: $error');
    throw error;
  }
}
