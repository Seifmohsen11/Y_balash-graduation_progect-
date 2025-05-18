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

  // Handle Dio exceptions
  Exception _handleDioException(DioException e) {
    if (e.response != null && e.response!.data is Map<String, dynamic>) {
      return Exception(e.response!.data['message'] ?? 'An error occurred');
    } else {
      return Exception('Request failed: ${e.message}');
    }
  }

  // GET request
  Future<dynamic> get({
    required String endpoint,
    String? token,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await _dio.get(endpoint,
          queryParameters: queryParams, options: _buildOptions(token: token));
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleDioException(e);
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
    } on DioException catch (e) {
      throw _handleDioException(e);
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
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // DELETE request
  Future<dynamic> delete({required String endpoint, String? token}) async {
    try {
      final response =
          await _dio.delete(endpoint, options: _buildOptions(token: token));
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // Image file request
  Future<dynamic> putFormData({
    required String endpoint,
    required FormData formData,
    String? token,
  }) async {
    try {
      final response = await _dio.put(
        endpoint,
        data: formData,
        options: _buildOptions(token: token),
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }
}
