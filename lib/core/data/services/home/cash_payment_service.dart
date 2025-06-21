import 'package:y_balash/core/helper/api.dart';
import 'package:y_balash/core/helper/shared_pref_helper.dart';

final apiService = ApiService(baseUrl: 'https://y-balash.vercel.app/api/');

Future<String> cashPayment() async {
  try {
    String? token = await SharedPrefHelper.getToken();
    if (token == null) throw Exception("No token found");

    final response = await apiService.post(
      endpoint: 'payment/cash-payment',
      token: token,
    );

    print('Cash payment initiated successfully: $response');

    final orderId = response['orderId'];
    if (orderId == null) throw Exception("orderId not found in response");

    return orderId;
  } catch (error) {
    print('Failed to initiate cash payment: $error');
    throw error;
  }
}
