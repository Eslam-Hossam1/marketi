import 'package:nextcart/core/models/product_model.dart';
import '../../domain/entities/cart_entity.dart';
import '../../domain/entities/cart_item_entity.dart';

class CartResponseModel extends CartEntity {
  const CartResponseModel({
    required super.items,
    required super.total,
  });

  factory CartResponseModel.fromSupabase(List<dynamic> rows) {
    if (rows.isEmpty) {
      return const CartResponseModel(
        items: [],
        total: 0,
      );
    }

    final items = <CartItemEntity>[];

    for (final row in rows) {
      final productJson = row['products'] as Map<String, dynamic>;
      final product = ProductModel.fromJson(productJson);
      final quantity = (row['quantity'] as int?) ?? 1;
      items.add(CartItemEntity(product: product, quantity: quantity));
    }

    return CartResponseModel(
      items: items,
      total: items.length,
    );
  }
}
