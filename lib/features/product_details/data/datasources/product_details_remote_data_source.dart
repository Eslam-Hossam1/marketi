import '../../domain/params/product_details_params.dart';
import '../models/product_details_model.dart';

abstract class ProductDetailsRemoteDataSource {
  Future<ProductDetailsModel> getProductDetails(ProductDetailsParams params);
}
