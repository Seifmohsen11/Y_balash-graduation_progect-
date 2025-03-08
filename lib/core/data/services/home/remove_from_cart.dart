import 'package:y_balash/core/helper/api.dart';
import 'package:y_balash/core/helper/shared_pref_helper.dart';

final apiService = ApiService(baseUrl: 'https://y-balash.vercel.app/api/');

Future<bool> removeFromCart(String itemId) async {
  try {
    String? token = await SharedPrefHelper.getToken();
    if (token == null) {
      print("Error: No token found.");
      return false;
    }

    String url = 'https://y-balash.vercel.app/api/remove/$itemId';
    print("Sending DELETE request to: $url");

    final response = await apiService.delete(
      endpoint: 'cart/remove/$itemId',
      token: token,
    );

    print("Response: $response");

    if (response != null && response['message'] == "Item removed from cart") {
      print('Item removed successfully.');
      return true;
    } else {
      print('Failed to remove item: Unexpected response format');
      return false;
    }
  } catch (error) {
    print('Failed to delete item: $error');
    return false;
  }
}
