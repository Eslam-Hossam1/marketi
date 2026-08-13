class ProductParams {
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

  const ProductParams({
    this.skip = 0,
    this.limit = 10,
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
}
