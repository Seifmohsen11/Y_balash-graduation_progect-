import 'package:y_balash/core/helper/api.dart';
import 'package:y_balash/core/helper/shared_pref_helper.dart';

final apiService = ApiService(baseUrl: 'https://y-balash.vercel.app/api/');

Future<List<dynamic>> getCartProduct() async {
  try {
    String? token = await SharedPrefHelper.getToken();
    if (token == null) {
      print("Error: No token found. User might not be logged in.");
      return []; // Return empty list if no token found
    }

    // Make the API request
    final response = await apiService.get(endpoint: 'cart', token: token);

    // Assuming the response is a map with an 'items' key that holds the list
    if (response != null && response['items'] != null) {
      return response['items']; // Extract the list of items from the response
    } else {
      print("Error: No items found in the response");
      return []; // Return empty list if 'items' is not found
    }
  } catch (error) {
    print('Failed to fetch cart products: $error');
    throw error; // Rethrow the error
  }
}
