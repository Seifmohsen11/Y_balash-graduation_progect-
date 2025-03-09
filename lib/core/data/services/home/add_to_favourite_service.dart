import 'package:y_balash/core/helper/api.dart';
import 'package:y_balash/core/helper/shared_pref_helper.dart';

final apiService = ApiService(baseUrl: 'https://y-balash.vercel.app/api/');

Future<void> AddToFavourite(
  String itemId,
) async {
  final itemData = {
    'itemId': itemId,
  };

  try {
    String? token = await SharedPrefHelper.getToken();
    if (token == null) {
      print("Error: No token found. User might not be logged in.");
      return;
    }
    String url = 'https://y-balash.vercel.app/api/favorites/add/$itemId';
    print("Sending Add request to: $url");

    final response = await apiService.post(
      endpoint: 'favorites/add',
      body: itemData,
      token: token,
    );
    print('added Successfully: $response');
  } catch (error) {
    print('Failed to add item: $error');
    throw error;
  }
}
