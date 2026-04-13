import 'package:marketi/core/entities/product_entity.dart';
import 'review_entity.dart';

class ProductDetailsEntity extends ProductEntity {
  final String? shippingInformation;
  final List<ReviewEntity> reviews;

  const ProductDetailsEntity({
    required super.id,
    required super.title,
    required super.description,
    required super.category,
    required super.price,
    required super.discountPercentage,
    required super.rating,
    required super.stock,
    required super.tags,
    super.brand,
    super.sku,
    super.availabilityStatus,
    required super.images,
    required super.thumbnail,
    this.shippingInformation,
    required this.reviews,
  });
}
