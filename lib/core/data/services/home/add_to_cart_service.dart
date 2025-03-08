import 'package:y_balash/core/helper/api.dart';
import 'package:y_balash/core/helper/shared_pref_helper.dart';

final apiService = ApiService(baseUrl: 'https://y-balash.vercel.app/api/');

Future<void> AddToCart(
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

    final response = await apiService.post(
      endpoint: 'cart/add',
      body: itemData,
      token: token,
    );
    print('added Successfully: $response');
  } catch (error) {
    print('Failed to add item: $error');
    throw error;
  }
}
