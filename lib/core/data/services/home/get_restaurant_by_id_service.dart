import 'package:y_balash/core/helper/api.dart';

final apiService = ApiService(baseUrl: 'https://y-balash.vercel.app/api/');

Future<Map<String, dynamic>> getRestaurantsById(String id) async {
  try {
    final response = await apiService.get(endpoint: 'restaurants/$id');
    return response as Map<String, dynamic>;
  } catch (error) {
    print('Failed to fetch data: $error');
    throw error;
  }
}
