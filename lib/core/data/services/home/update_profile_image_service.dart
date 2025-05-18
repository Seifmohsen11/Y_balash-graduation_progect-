import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:y_balash/core/helper/api.dart';
import 'package:y_balash/core/helper/shared_pref_helper.dart';

final apiService = ApiService(baseUrl: 'https://y-balash.vercel.app/api/');

Future<void> updateProfileImage(XFile? imageFile) async {
  try {
    String? token = await SharedPrefHelper.getToken();
    if (token == null) {
      print("No token found");
      return;
    }

    if (imageFile != null) {
      final formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(
          imageFile.path,
          filename: imageFile.name,
        ),
      });

      final response = await apiService.putFormData(
        endpoint: 'user/update-profile-image',
        formData: formData,
        token: token,
      );

      print('Profile image updated successfully: $response');
    } else if (imageFile == null) {
      final formData = FormData.fromMap({'image': null});

      final response = await apiService.putFormData(
        endpoint: 'user/update-profile-image',
        formData: formData,
        token: token,
      );

      print('Profile image updated successfully: $response');
    }
  } catch (error) {
    print('Failed to update profile image: $error');
    throw error;
  }
}
