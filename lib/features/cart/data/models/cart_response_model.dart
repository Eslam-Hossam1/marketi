import 'package:marketi/core/models/product_model.dart';
import '../../domain/entities/cart_entity.dart';

class CartResponseModel extends CartEntity {
  const CartResponseModel({
    required List<ProductModel> super.products,
    required super.total,
    required super.skip,
    required super.limit,
  });

  factory CartResponseModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> outerList = json['list'] as List? ?? [];
    if (outerList.isEmpty) {
      return const CartResponseModel(
        products: [],
        total: 0,
        skip: 0,
        limit: 0,
      );
    }

    final metadata = outerList[0] as Map<String, dynamic>;
    final products = outerList
        .skip(1)
        .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
        .toList();

    return CartResponseModel(
      products: products,
      total: metadata['total'] as int? ?? 0,
      skip: metadata['skip'] as int? ?? 0,
      limit: metadata['limit'] as int? ?? 0,
    );
  }
}
