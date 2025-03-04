import 'package:y_balash/core/helper/api.dart';

final apiService = ApiService(baseUrl: 'https://y-balash.vercel.app/api/');

Future<List<dynamic>> getItems() async {
  try {
    final response = await apiService.get(endpoint: 'images/all');
    return response; // Ensure this returns a List
  } catch (error) {
    print('Failed to fetch images: $error');
    throw error;
  }
}
