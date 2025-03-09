import 'package:y_balash/core/data/services/home/get_favourite_product_service.dart';

Future<bool> isProductFavorite(String productId) async {
  final favoriteProducts = await getFavoriteProduct();
  return favoriteProducts
      .any((product) => product['itemId']['_id'] == productId);
}
