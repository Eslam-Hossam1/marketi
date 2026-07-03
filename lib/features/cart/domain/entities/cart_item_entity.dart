import 'package:equatable/equatable.dart';
import 'package:nextcart/core/entities/product_entity.dart';

class CartItemEntity extends Equatable {
  final ProductEntity product;
  final int quantity;

  const CartItemEntity({
    required this.product,
    required this.quantity,
  });

  @override
  List<Object?> get props => [product, quantity];
}
