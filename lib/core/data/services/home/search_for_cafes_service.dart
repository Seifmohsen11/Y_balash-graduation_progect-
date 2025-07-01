import 'package:y_balash/core/data/services/auth/login_service.dart';

Future<List<Map<String, dynamic>>> searchCafesByName(String name) async {
  try {
    final response = await apiService.get(
      endpoint: 'restaurants/search',
      queryParams: {'name': name},
    );

    if (response != null && response is List) {
      return response.cast<Map<String, dynamic>>();
    } else {
      print("Error: Unexpected response format or empty");
      return [];
    }
  } catch (error) {
    print('Failed to search cafes: $error');
    return [];
  }
}
