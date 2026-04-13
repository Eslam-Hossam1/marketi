import 'package:marketi/core/networking/api_consumer.dart';
// ignore: unused_import
import 'package:marketi/core/networking/end_points.dart';
import '../../domain/params/product_details_params.dart';
import '../models/product_details_model.dart';
import 'product_details_remote_data_source.dart';

class ProductDetailsRemoteDataSourceImpl
    implements ProductDetailsRemoteDataSource {
  // ignore: unused_field
  final ApiConsumer _apiConsumer;

  ProductDetailsRemoteDataSourceImpl(this._apiConsumer);

  @override
  Future<ProductDetailsModel> getProductDetails(
      ProductDetailsParams params) async {
    // Temporarily returning dummy data because the API is down
    await Future.delayed(const Duration(seconds: 1));
    return ProductDetailsModel.fromJson({
      "id": params.productId,
      "title": "Essence Mascara Lash Princess (Dummy)",
      "description": "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula.",
      "category": "beauty",
      "price": 9.99,
      "discountPercentage": 10.48,
      "rating": 4.5,
      "stock": 99,
      "tags": ["beauty", "mascara"],
      "brand": "Essence",
      "sku": "BEA-ESS-ESS-001",
      "weight": 4,
      "dimensions": {"width": 15.14, "height": 13.08, "depth": 22.99},
      "warrantyInformation": "1 week warranty",
      "shippingInformation": "Free Shipping",
      "availabilityStatus": "In Stock",
      "reviews": [
        {
          "rating": 3,
          "comment": "Would not recommend!",
          "date": "2025-04-30T09:41:02.053Z",
          "reviewerName": "Eleanor Collins",
          "reviewerEmail": "eleanor.collins@x.dummyjson.com"
        },
        {
          "rating": 5,
          "comment": "Highly impressed!",
          "date": "2025-04-30T09:41:02.053Z",
          "reviewerName": "Lucas Gordon",
          "reviewerEmail": "lucas.gordon@x.dummyjson.com"
        }
      ],
      "returnPolicy": "No return policy",
      "minimumOrderQuantity": 48,
      "images": [
        "https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/1.webp",
        "https://cdn.dummyjson.com/product-images/beauty/eyeshadow-palette-with-mirror/1.webp",
        "https://cdn.dummyjson.com/product-images/beauty/powder-canister/1.webp",
        "https://cdn.dummyjson.com/product-images/beauty/red-lipstick/1.webp"
      ],
      "thumbnail": "https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/thumbnail.webp"
    });

    /*
    final response = await _apiConsumer.get(
      EndPoints.productDetailsPath(params.productId),
    );
    return ProductDetailsModel.fromJson(response);
    */
  }
}
