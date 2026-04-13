class BrandProductsRoutingParams {
  final String title;
  final String brand;

  const BrandProductsRoutingParams({
    required this.title,
    required this.brand,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'brand': brand,
    };
  }

  factory BrandProductsRoutingParams.fromJson(Map<String, dynamic> json) {
    return BrandProductsRoutingParams(
      title: json['title'] as String,
      brand: json['brand'] as String,
    );
  }
}
