import 'package:y_balash/core/helper/api.dart';
import 'package:y_balash/core/helper/shared_pref_helper.dart';

final apiService = ApiService(baseUrl: 'https://y-balash.vercel.app/api/');

Future<bool> removeFromCart({String? itemId, String? offerId}) async {
  try {
    String? token = await SharedPrefHelper.getToken();
    if (token == null) {
      print("Error: No token found.");
      return false;
    }

    String url = '';
    if (itemId != null) {
      url = 'https://y-balash.vercel.app/api/remove/$itemId';
    } else if (offerId != null) {
      url = 'https://y-balash.vercel.app/api/remove/$offerId';
    } else {
      print("Error: No itemId or offerId provided.");
      return false;
    }
    print("Sending DELETE request to: $url");

    final response = await apiService.delete(
      endpoint: 'cart/remove/${itemId ?? offerId}',
      token: token,
    );

    print("Response: $response");

    if (response != null &&
        response['message'] != null &&
        response['message'].contains("removed from cart")) {
      print('Item removed successfully.');
      return true;
    } else {
      print(
          'Failed to remove item: Unexpected response format ${response['message']}');
      return false;
    }
  } catch (error) {
    print('Failed to delete item: $error');
    return false;
  }
}
