import 'package:marketi/core/models/product_model.dart';
import 'package:marketi/features/orders/domain/entities/order_entity.dart';

class OrderModel extends OrderEntity {
  const OrderModel({
    required super.id,
    required super.products,
    required super.totalPrice,
    required super.orderDate,
    required super.status,
  });

  factory OrderModel.fromEntity(OrderEntity entity) {
    return OrderModel(
      id: entity.id,
      products: entity.products,
      totalPrice: entity.totalPrice,
      orderDate: entity.orderDate,
      status: entity.status,
    );
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'] as String,
      products: (json['products'] as List)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPrice: (json['totalPrice'] as num).toDouble(),
      orderDate: DateTime.parse(json['orderDate'] as String),
      status: json['status'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'products': products.map((e) => ProductModel(
        id: e.id,
        title: e.title,
        description: e.description,
        category: e.category,
        price: e.price,
        discountPercentage: e.discountPercentage,
        rating: e.rating,
        stock: e.stock,
        tags: e.tags,
        brand: e.brand,
        sku: e.sku,
        availabilityStatus: e.availabilityStatus,
        images: e.images,
        thumbnail: e.thumbnail,
      ).toJson()).toList(),
      'totalPrice': totalPrice,
      'orderDate': orderDate.toIso8601String(),
      'status': status,
    };
  }
}
