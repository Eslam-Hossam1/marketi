import 'package:nextcart/core/entities/product_entity.dart';

class CartEntity {
  final List<ProductEntity> products;
  final Map<String, int> quantities;
  final int total;

  const CartEntity({
    required this.products,
    required this.quantities,
    required this.total,
  });
}
