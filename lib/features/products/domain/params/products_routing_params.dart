import 'package:nextcart/core/params/product_params.dart';

class ProductsRoutingParams {
  final String title;
  final ProductParams params;

  const ProductsRoutingParams({
    required this.title,
    required this.params,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'params': params,
    };
  }
}
