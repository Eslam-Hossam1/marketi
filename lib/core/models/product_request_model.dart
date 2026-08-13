import '../params/product_params.dart';

class ProductRequestModel {
  final int skip;
  final int limit;
  final String? search;
  final String? brand;
  final String? category;
  final double? rating;
  final String? price;
  final double? discount;
  final bool? popular;
  final String? targetType;
  final String? targetOperator;
  final String? targetValue;

  const ProductRequestModel({
    required this.skip,
    required this.limit,
    this.search,
    this.brand,
    this.category,
    this.rating,
    this.price,
    this.discount,
    this.popular,
    this.targetType,
    this.targetOperator,
    this.targetValue,
  });

  factory ProductRequestModel.fromParams(ProductParams params) {
    return ProductRequestModel(
      skip: params.skip,
      limit: params.limit,
      search: params.search,
      brand: params.brand,
      category: params.category,
      rating: params.rating,
      price: params.price,
      discount: params.discount,
      popular: params.popular,
      targetType: params.targetType,
      targetOperator: params.targetOperator,
      targetValue: params.targetValue,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'skip': skip,
      'limit': limit,
      if (search != null) 'search': search,
      if (brand != null) 'brand': brand,
      if (category != null) 'category': category,
      if (rating != null) 'rating': rating,
      if (price != null) 'price': price,
      if (discount != null) 'discountPercentage': discount,
      if (popular != null) 'popular': popular,
      if (targetType != null) 'targetType': targetType,
      if (targetOperator != null) 'targetOperator': targetOperator,
      if (targetValue != null) 'targetValue': targetValue,
    };
  }
}
