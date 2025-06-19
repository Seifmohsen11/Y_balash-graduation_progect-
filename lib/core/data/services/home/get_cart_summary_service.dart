import 'package:y_balash/core/helper/api.dart';
import 'package:y_balash/core/helper/shared_pref_helper.dart';

final apiService = ApiService(baseUrl: 'https://y-balash.vercel.app/api/');

Future<Map<String, dynamic>> getCartSummary({bool usePoints = false}) async {
  try {
    String? token = await SharedPrefHelper.getToken();
    if (token == null) {
      print("Error: No token found.");
      return {};
    }

    final response = await apiService.post(
      endpoint: 'points/use-points',
      token: token,
      body: {'usePoints': usePoints},
    );

    if (response != null && response['success'] == true) {
      return response;
    } else {
      print("Error: Failed to fetch cart summary.");
      return {};
    }
  } catch (error) {
    print('Failed to fetch cart summary: $error');
    throw error;
  }
}
