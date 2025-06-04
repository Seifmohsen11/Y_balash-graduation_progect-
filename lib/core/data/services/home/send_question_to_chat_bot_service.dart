import 'package:y_balash/core/helper/api.dart';

final apiService = ApiService(baseUrl: 'http://185.225.233.14:8000/');

Future<String> sendChatQuestion({
  required String question,
  required String language,
}) async {
  final body = {
    'question': question,
    'lang': language,
  };

  try {
    final response = await apiService.post(
      endpoint: 'chat',
      body: body,
    );

    print('Response: $response');
    return response['answer'] ?? 'No response';
  } catch (error) {
    print('Failed to send question: $error');
    rethrow;
  }
}
