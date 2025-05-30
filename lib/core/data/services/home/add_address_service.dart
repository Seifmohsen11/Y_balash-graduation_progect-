import 'package:y_balash/core/helper/api.dart';
import 'package:y_balash/core/helper/shared_pref_helper.dart';

final apiService = ApiService(baseUrl: 'https://y-balash.vercel.app/api/');

Future<void> addAddress({
  required String fullAddress,
  required String city,
  required String area,
  required String nearbyLandmark,
  required String label,
}) async {
  final addressData = {
    'fullAddress': fullAddress,
    'city': city,
    'area': area,
    'nearbyLandmark': nearbyLandmark,
    'label': label,
  };

  try {
    String? token = await SharedPrefHelper.getToken();
    if (token == null) {
      print("Error: No token found. User might not be logged in.");
      return;
    }

    final response = await apiService.post(
      endpoint: 'addresses',
      body: addressData,
      token: token,
    );
    print('Address added successfully: $response');
  } catch (error) {
    print('Failed to add address: $error');
    throw error;
  }
}
