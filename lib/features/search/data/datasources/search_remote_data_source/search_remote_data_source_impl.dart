import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:nextcart/core/models/product_request_model.dart';
import 'package:nextcart/core/models/products_response_model.dart';
import 'package:nextcart/core/models/product_model.dart';
import 'search_remote_data_source.dart';

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final SupabaseClient _supabaseClient;

  SearchRemoteDataSourceImpl(this._supabaseClient);

  @override
  Future<ProductsResponseModel> searchProducts(
      ProductRequestModel requestModel) async {
    final limit = requestModel.limit;
    final skip = requestModel.skip;

    final response = await _supabaseClient
        .from('products')
        .select('*, categories(*), brands(*)')
        .ilike('title', '%${requestModel.search ?? ''}%')
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
