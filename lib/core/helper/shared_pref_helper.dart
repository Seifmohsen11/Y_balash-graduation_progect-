import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static const String tokenKey = "user_token";
  static const String userImageKey = 'user_image';

  /// Save user token
  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(tokenKey, token);
  }

  /// Get user token
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(tokenKey);
  }

  /// Remove user token (for logout)
  static Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(tokenKey);
  }

  /// Clear all user data (Logout)
  static Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  /// Save user Image
  static Future<void> saveUserImage(String imagePath) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(userImageKey, imagePath);
  }

  /// Get user Image
  static Future<String?> getUserImage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(userImageKey);
  }

  /// Remove user image
  static Future<void> removeUserImage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(userImageKey);
  }
}
