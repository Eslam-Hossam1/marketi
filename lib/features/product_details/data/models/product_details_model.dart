import '../../domain/entities/product_details_entity.dart';
import 'review_model.dart';

class ProductDetailsModel extends ProductDetailsEntity {
  const ProductDetailsModel({
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
    super.shippingInformation,
    required super.reviews,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    final reviewsJson = json['reviews'] as List<dynamic>? ?? [];
    return ProductDetailsModel(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      price: (json['price'] as num).toDouble(),
      discountPercentage: (json['discountPercentage'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      stock: json['stock'] as int,
      tags: List<String>.from(json['tags'] ?? []),
      brand: json['brand'] as String?,
      sku: json['sku'] as String?,
      availabilityStatus: json['availabilityStatus'] as String?,
      images: List<String>.from(json['images'] ?? []),
      thumbnail: json['thumbnail'] as String,
      shippingInformation: json['shippingInformation'] as String?,
      reviews: reviewsJson.map((e) => ReviewModel.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'price': price,
      'discountPercentage': discountPercentage,
      'rating': rating,
      'stock': stock,
      'tags': tags,
      'brand': brand,
      'sku': sku,
      'availabilityStatus': availabilityStatus,
      'images': images,
      'thumbnail': thumbnail,
      'shippingInformation': shippingInformation,
      'reviews': reviews.map((e) => (e as ReviewModel).toJson()).toList(),
    };
  }
}
