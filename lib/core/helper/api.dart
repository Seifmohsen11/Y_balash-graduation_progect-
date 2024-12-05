import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  // Build headers
  Map<String, String> _buildHeaders({String? token}) {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    return headers;
  }

  // Unified response handler
  dynamic _handleResponse(http.Response response) {
    final statusCode = response.statusCode;
    final body = response.body.isNotEmpty ? jsonDecode(response.body) : null;

    if (statusCode >= 200 && statusCode < 300) {
      return body;
    } else {
      final error = body?['message'] ?? 'An error occurred';
      throw Exception('Error $statusCode: $error');
    }
  }

  // GET request
  Future<dynamic> get({required String endpoint, String? token}) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final headers = _buildHeaders(token: token);

    try {
      final response = await http.get(url, headers: headers);
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
    final url = Uri.parse('$baseUrl$endpoint');
    final headers = _buildHeaders(token: token);

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode(body),
      );
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
    final url = Uri.parse('$baseUrl$endpoint');
    final headers = _buildHeaders(token: token);

    try {
      final response = await http.put(
        url,
        headers: headers,
        body: json.encode(body),
      );
      return _handleResponse(response);
    } catch (e) {
      throw Exception('PUT request failed: $e');
    }
  }

  // DELETE request
  Future<dynamic> delete({required String endpoint, String? token}) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final headers = _buildHeaders(token: token);

    try {
      final response = await http.delete(url, headers: headers);
      return _handleResponse(response);
    } catch (e) {
      throw Exception('DELETE request failed: $e');
    }
  }
}
