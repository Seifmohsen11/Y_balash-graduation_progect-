import 'package:y_balash/core/data/services/auth/login_service.dart';
import 'package:y_balash/core/helper/shared_pref_helper.dart';

Future<void> sendOrderIdToGetPoints(String orderId) async {
  try {
    String? token = await SharedPrefHelper.getToken();
    if (token == null) throw Exception("No token found");

    final response = await apiService.post(
      endpoint: 'user/get-points',
      token: token,
      body: {
        "orderId": orderId,
      },
    );

    print("Points added successfully: $response");
  } catch (e) {
    print("Error sending orderId to get-points: $e");
    rethrow;
  }
}
