import 'package:marketi/core/entities/product_entity.dart';

class PaymobProductModel {
  final String name;
  final int amountCents;
  final String description;
  final int quantity;

  PaymobProductModel({
    required this.name,
    required this.amountCents,
    required this.description,
    required this.quantity,
  });

  factory PaymobProductModel.fromProductEntity(ProductEntity entity, int quantity) {
    return PaymobProductModel(
      name: entity.title,
      amountCents: (entity.price * 100).toInt(),
      description: entity.description,
      quantity: quantity,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'amount': amountCents,
      'description': description,
      'quantity': quantity,
    };
  }
}
