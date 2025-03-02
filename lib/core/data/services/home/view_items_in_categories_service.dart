import 'package:y_balash/core/helper/api.dart';

class ProductService {
  final apiService = ApiService(baseUrl: 'https://y-balash.vercel.app/api/');

  Future<List<dynamic>> fetchProducts(String categoryId) async {
    final response = await apiService.post(
      endpoint: 'categories/items',
      body: {'categoryId': categoryId},
    );
    return response;
  }
}
