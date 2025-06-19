import 'package:y_balash/core/helper/api.dart';
import 'package:y_balash/core/helper/shared_pref_helper.dart';

final apiService = ApiService(baseUrl: 'https://y-balash.vercel.app/api/');

Future<int> getCoinsBalance() async {
  try {
    String? token = await SharedPrefHelper.getToken();
    if (token == null) {
      print("Error: No token found. User might not be logged in.");
      return 0; // رجع صفر لو مفيش توكن
    }

    final response = await apiService.get(endpoint: 'points', token: token);

    if (response != null && response['points'] != null) {
      return int.tryParse(response['points'].toString()) ?? 0;
    } else {
      print("Error: 'points' not found in response");
      return 0;
    }
  } catch (error) {
    print('Failed to fetch coins balance: $error');
    return 0;
  }
}
