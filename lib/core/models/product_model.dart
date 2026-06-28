import '../entities/product_entity.dart';
import 'category_model.dart';
import 'brand_model.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.title,
    required super.description,
    super.category,
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
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'].toString(),
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['categories'] != null ? CategoryModel.fromJson(json['categories']) : null,
      price: (json['price'] as num).toDouble(),
      discountPercentage: (json['discountPercentage'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      stock: json['stock'] as int,
      tags: List<String>.from(json['tags'] ?? []),
      brand: json['brands'] != null ? BrandModel.fromJson(json['brands']) : null,
      sku: json['sku'] as String?,
      availabilityStatus: json['availabilityStatus'] as String?,
      images: List<String>.from(json['images'] ?? []),
      thumbnail: json['thumbnail'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category_id': category?.id,
      'price': price,
      'discountPercentage': discountPercentage,
      'rating': rating,
      'stock': stock,
      'tags': tags,
      'brand_id': brand?.id,
      'sku': sku,
      'availabilityStatus': availabilityStatus,
      'images': images,
      'thumbnail': thumbnail,
    };
  }
}
