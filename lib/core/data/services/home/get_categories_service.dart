import 'package:y_balash/core/helper/api.dart';

final apiService = ApiService(baseUrl: 'https://y-balash.vercel.app/api/');

Future<List<dynamic>> getCategories() async {
  try {
    final response = await apiService.get(endpoint: 'categories/all');
    return response;
  } catch (error) {
    print('Failed to fetch categories: $error');
    throw error;
  }
}
