import 'package:y_balash/core/helper/api.dart';
import 'package:y_balash/core/helper/shared_pref_helper.dart';

final apiService = ApiService(baseUrl: 'https://y-balash.vercel.app/api/');

Future<void> UpdateCart(
  String itemId,
  int quantity,
) async {
  final itemData = {
    'itemId': itemId,
    'quantity': quantity,
  };

  try {
    String? token = await SharedPrefHelper.getToken();
    if (token == null) {
      print("Error: No token found. User might not be logged in.");
      return;
    }

    final response = await apiService.put(
      endpoint: 'cart/update',
      body: itemData,
      token: token,
    );
    print('updated Successfully: $response');
  } catch (error) {
    print('Failed to update item: $error');
    throw error;
  }
}
