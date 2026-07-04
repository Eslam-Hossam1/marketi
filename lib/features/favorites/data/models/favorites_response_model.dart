import 'package:nextcart/core/models/product_model.dart';
import '../../domain/entities/favorites_entity.dart';

class FavoritesResponseModel extends FavoritesEntity {
  const FavoritesResponseModel({
    required super.products,
  });

  factory FavoritesResponseModel.fromSupabaseResponse(List<dynamic> response) {
    final products = response.map((e) {
      return ProductModel.fromJson(e['products'] as Map<String, dynamic>);
    }).toList();

    return FavoritesResponseModel(products: products);
  }
}
