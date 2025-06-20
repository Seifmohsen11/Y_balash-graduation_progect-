// lib/core/data/services/points/add_points_service.dart
import 'package:y_balash/core/helper/api.dart';
import 'package:y_balash/core/helper/shared_pref_helper.dart';

final apiService = ApiService(baseUrl: 'https://y-balash.vercel.app/api/');

Future<Map<String, dynamic>> addPointsAfterPayment(
    {required double totalAmount}) async {
  try {
    final String? token = await SharedPrefHelper.getToken();
    if (token == null) {
      throw Exception("User not logged in. Token is null.");
    }

    final body = {
      'totalAmount': totalAmount,
    };

    final response = await apiService.post(
      endpoint: 'points/calculate',
      body: body,
      token: token,
    );

    print('Points added: $response');

    return {
      'message': response['message'],
      'pointsAdded': response['pointsAdded'],
      'totalPoints': response['totalPoints'],
    };
  } catch (e) {
    print('Failed to add points: $e');
    throw e;
  }
}
