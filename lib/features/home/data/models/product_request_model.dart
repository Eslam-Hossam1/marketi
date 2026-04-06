import '../../domain/params/product_params.dart';

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
    };
  }
}
