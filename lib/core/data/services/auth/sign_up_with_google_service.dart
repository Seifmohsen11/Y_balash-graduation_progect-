import 'package:y_balash/core/helper/api.dart';
import 'package:url_launcher/url_launcher.dart';

final apiService = ApiService(baseUrl: 'https://y-balash.vercel.app/');

Future<void> signUpWithGoogle() async {
  try {
    final Uri url = Uri.parse('${apiService.baseUrl}auth/google');

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
      print('Opened Google Sign-In URL successfully.');
    } else {
      throw 'Could not launch $url';
    }
  } catch (error) {
    print('Signup Failed: $error');
    throw error;
  }
}
