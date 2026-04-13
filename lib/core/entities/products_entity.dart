import 'product_entity.dart';

class ProductsEntity {
  final List<ProductEntity> list;
  final int total;
  final int skip;
  final int limit;

  const ProductsEntity({
    required this.list,
    required this.total,
    required this.skip,
    required this.limit,
  });
}
