import 'package:y_balash/core/helper/api.dart';
import 'package:y_balash/core/helper/shared_pref_helper.dart';

final apiService = ApiService(baseUrl: 'https://y-balash.vercel.app/api/');

Future<Map<String, dynamic>> getUserInfo() async {
  try {
    String? token = await SharedPrefHelper.getToken();
    if (token == null) {
      print("Error: No token found. User might not be logged in.");
      return {};
    }

    final response =
        await apiService.get(endpoint: 'user/profile', token: token);

    if (response != null) {
      return response;
    } else {
      print("Error: No info found in the response");
      return {};
    }
  } catch (error) {
    print('Failed to fetch user info: $error');
    throw error;
  }
}
