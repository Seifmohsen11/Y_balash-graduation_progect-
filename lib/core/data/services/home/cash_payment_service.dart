import 'package:y_balash/core/helper/api.dart';
import 'package:y_balash/core/helper/shared_pref_helper.dart';

final apiService = ApiService(baseUrl: 'https://y-balash.vercel.app/api/');

Future<void> cashPayment() async {
  try {
    String? token = await SharedPrefHelper.getToken();
    if (token == null) {
      print("Error: No token found. User might not be logged in.");
      return;
    }

    final response = await apiService.post(
      endpoint: 'payment/cash-payment',
      token: token,
    );

    print('Cash payment initiated successfully: $response');
  } catch (error) {
    print('Failed to initiate cash payment: $error');
    throw error;
  }
}
