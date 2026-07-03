import 'package:nextcart/core/models/product_model.dart';
import '../../domain/entities/cart_entity.dart';

class CartResponseModel extends CartEntity {
  const CartResponseModel({
    required List<ProductModel> super.products,
    required super.quantities,
    required super.total,
  });

  factory CartResponseModel.fromSupabase(List<dynamic> rows) {
    if (rows.isEmpty) {
      return const CartResponseModel(
        products: [],
        quantities: {},
        total: 0,
      );
    }

    final quantities = <String, int>{};
    final products = <ProductModel>[];

    for (final row in rows) {
      final productJson = row['products'] as Map<String, dynamic>;
      final product = ProductModel.fromJson(productJson);
      final quantity = (row['quantity'] as int?) ?? 1;
      quantities[product.id] = quantity;
      products.add(product);
    }

    return CartResponseModel(
      products: products,
      quantities: quantities,
      total: products.length,
    );
  }
}
