import 'package:y_balash/core/helper/api.dart';

final apiService = ApiService(baseUrl: 'https://y-balash.vercel.app/api/');

Future<List<dynamic>> getBestSelling() async {
  try {
    final response = await apiService.get(endpoint: 'images/best-selling');
    return response; // Ensure this returns a List
  } catch (error) {
    print('Failed to fetch best-selling products: $error');
    throw error;
  }
}
