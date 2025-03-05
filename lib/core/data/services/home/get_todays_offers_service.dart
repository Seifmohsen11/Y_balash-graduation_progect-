import 'package:y_balash/core/helper/api.dart';

final apiService = ApiService(baseUrl: 'https://y-balash.vercel.app/api/');

Future<List<dynamic>> getTodaysOffers() async {
  try {
    final response = await apiService.get(endpoint: 'offers/all');
    return response;
  } catch (error) {
    print('Failed to fetch TodaysOffers: $error');
    throw error;
  }
}
