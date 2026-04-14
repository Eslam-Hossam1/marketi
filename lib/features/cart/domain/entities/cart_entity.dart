import 'package:marketi/core/entities/product_entity.dart';

class CartEntity {
  final List<ProductEntity> products;
  final int total;
  final int skip;
  final int limit;

  const CartEntity({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });
}
