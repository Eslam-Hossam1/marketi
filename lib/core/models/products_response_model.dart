import '../entities/products_entity.dart';
import 'product_model.dart';

class ProductsResponseModel extends ProductsEntity {
  const ProductsResponseModel({
    required List<ProductModel> super.list,
    required super.total,
    required super.skip,
    required super.limit,
  });

  factory ProductsResponseModel.fromJson(Map<String, dynamic> json) {
    return ProductsResponseModel(
      list: (json['list'] as List)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int ?? 0,
      skip: json['skip'] as int ?? 0,
      limit: json['limit'] as int ?? 0,
    );
  }
}
