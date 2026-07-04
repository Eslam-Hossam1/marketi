import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:nextcart/core/models/product_request_model.dart';
import 'package:nextcart/core/models/products_response_model.dart';
import 'package:nextcart/core/models/product_model.dart';
import 'products_remote_data_source.dart';

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  final SupabaseClient _supabaseClient;

  ProductsRemoteDataSourceImpl(this._supabaseClient);

  @override
  Future<ProductsResponseModel> getProducts(
      ProductRequestModel requestModel) async {
    final limit = requestModel.limit;
    final skip = requestModel.skip;

    final response = await _supabaseClient
        .from('products')
        .select('*, categories(*), brands(*)')
        .range(skip, skip + limit - 1);

    final list = (response as List)
        .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
        .toList();

    return ProductsResponseModel(
      list: list,
      total: list.length,
      skip: skip,
      limit: limit,
    );
  }
}
