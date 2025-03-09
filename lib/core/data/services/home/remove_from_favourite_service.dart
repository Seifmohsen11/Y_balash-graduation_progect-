import 'package:y_balash/core/helper/api.dart';
import 'package:y_balash/core/helper/shared_pref_helper.dart';

final apiService = ApiService(baseUrl: 'https://y-balash.vercel.app/api/');

Future<bool> removeFromFavourite(String itemId) async {
  try {
    String? token = await SharedPrefHelper.getToken();
    if (token == null) {
      print("Error: No token found.");
      return false;
    }

    String url = 'https://y-balash.vercel.app/api/favorites/remove/$itemId';
    print("Sending DELETE request to: $url");

    final response = await apiService.delete(
      endpoint: 'favorites/remove/$itemId',
      token: token,
    );

    print('added Successfully: $response');
    return true;
  } catch (error) {
    print('Failed to delete item: $error');
    return false;
  }
}
