import 'package:dio/dio.dart';

class ApiService {
  final String baseUrl;
  final Dio _dio;

  ApiService({required this.baseUrl})
      : _dio =
            Dio(BaseOptions(baseUrl: baseUrl, contentType: 'application/json'));

  // Build headers
  Options _buildOptions({String? token}) {
    return Options(
      headers: token != null ? {'Authorization': 'Bearer $token'} : {},
    );
  }

  // Unified response handler
  dynamic _handleResponse(Response response) {
    if (response.statusCode != null &&
        response.statusCode! >= 200 &&
        response.statusCode! < 300) {
      return response.data;
    } else {
      throw Exception(
          'Error ${response.statusCode}: ${response.data?['message'] ?? 'An error occurred'}');
    }
  }

  // GET request
  Future<dynamic> get({required String endpoint, String? token}) async {
    try {
      final response =
          await _dio.get(endpoint, options: _buildOptions(token: token));
      return _handleResponse(response);
    } catch (e) {
      throw Exception('GET request failed: $e');
    }
  }

  // POST request
  Future<dynamic> post({
    required String endpoint,
    required Map<String, dynamic> body,
    String? token,
  }) async {
    try {
      final response = await _dio.post(endpoint,
          data: body, options: _buildOptions(token: token));
      return _handleResponse(response);
    } catch (e) {
      throw Exception('POST request failed: $e');
    }
  }

  // PUT request
  Future<dynamic> put({
    required String endpoint,
    required Map<String, dynamic> body,
    String? token,
  }) async {
    try {
      final response = await _dio.put(endpoint,
          data: body, options: _buildOptions(token: token));
      return _handleResponse(response);
    } catch (e) {
      throw Exception('PUT request failed: $e');
    }
  }

  // DELETE request
  Future<dynamic> delete({required String endpoint, String? token}) async {
    try {
      final response =
          await _dio.delete(endpoint, options: _buildOptions(token: token));
      return _handleResponse(response);
    } catch (e) {
      throw Exception('DELETE request failed: $e');
    }
  }
}
