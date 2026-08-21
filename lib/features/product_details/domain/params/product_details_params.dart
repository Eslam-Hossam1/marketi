class ProductDetailsRoutingParams {
  final String productId;

  const ProductDetailsRoutingParams({required this.productId});

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
    };
  }

  factory ProductDetailsRoutingParams.fromJson(Map<String, dynamic> json) {
    return ProductDetailsRoutingParams(
      productId: json['productId'] as String,
    );
  }
}

class ProductDetailsParams {
  final String productId;

  const ProductDetailsParams({required this.productId});
}
