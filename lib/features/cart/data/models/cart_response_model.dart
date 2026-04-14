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
    final outerList = json['list'] as List;
    if (outerList.isEmpty) {
      return const CartResponseModel(
        products: [],
        total: 0,
        skip: 0,
        limit: 0,
      );
    }

    final innerData = outerList[0] as Map<String, dynamic>;
    return CartResponseModel(
      products: (innerData['list'] as List)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: innerData['total'] as int? ?? 0,
      skip: innerData['skip'] as int? ?? 0,
      limit: innerData['limit'] as int? ?? 0,
    );
  }
}
