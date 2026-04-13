class CategoryProductsRoutingParams {
  final String title;
  final String categorySlug;

  const CategoryProductsRoutingParams({
    required this.title,
    required this.categorySlug,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'categorySlug': categorySlug,
    };
  }

  factory CategoryProductsRoutingParams.fromJson(Map<String, dynamic> json) {
    return CategoryProductsRoutingParams(
      title: json['title'] as String,
      categorySlug: json['categorySlug'] as String,
    );
  }
}
