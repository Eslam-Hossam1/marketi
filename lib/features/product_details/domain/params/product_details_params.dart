class ProductDetailsRoutingParams {
  final int productId;

  const ProductDetailsRoutingParams({required this.productId});

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
    };
  }

  factory ProductDetailsRoutingParams.fromJson(Map<String, dynamic> json) {
    return ProductDetailsRoutingParams(
      productId: json['productId'] as int,
    );
  }
}

class ProductDetailsParams {
  final int productId;

  const ProductDetailsParams({required this.productId});
}
