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
  });
}
