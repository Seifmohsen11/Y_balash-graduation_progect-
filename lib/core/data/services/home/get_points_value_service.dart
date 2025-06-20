import 'package:y_balash/core/helper/api.dart';
import 'package:y_balash/core/helper/shared_pref_helper.dart';

final apiService = ApiService(baseUrl: 'https://y-balash.vercel.app/api/');

Future<Map<String, dynamic>> getPointsValue() async {
  try {
    String? token = await SharedPrefHelper.getToken();
    if (token == null) {
      print("Error: No token found.");
      return {};
    }

    final response = await apiService.get(
      endpoint: 'points/value',
      token: token,
    );

    if (response != null &&
        response['points'] != null &&
        response['equivalentEgp'] != null &&
        response['conversionRate'] != null) {
      return {
        "points": int.tryParse(response['points'].toString()) ?? 0,
        "equivalentEgp":
            double.tryParse(response['equivalentEgp'].toString()) ?? 0.0,
        "conversionRate": response['conversionRate'].toString(),
      };
    } else {
      print("Error: Unexpected response format.");
      return {};
    }
  } catch (error) {
    print('Failed to fetch points value: $error');
    return {};
  }
}
