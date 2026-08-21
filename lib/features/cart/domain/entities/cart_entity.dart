import 'cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> items;
  final int total;

  const CartEntity({
    required this.items,
    required this.total,
  });
}
