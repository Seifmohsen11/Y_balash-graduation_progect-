import 'package:y_balash/core/helper/api.dart';

final apiService = ApiService(baseUrl: 'https://y-balash.vercel.app/api/');

Future<Map<String, dynamic>?> FetchItemDetails(String itemId) async {
  final itemData = {
    'id': itemId,
  };

  try {
    final response = await apiService.post(
      endpoint: 'images/item-details',
      body: itemData,
    );
    print('fetched Successfully: $response');

    return response;
  } catch (error) {
    print('Failed to fetch item details: $error');
    throw error;
  }
}
