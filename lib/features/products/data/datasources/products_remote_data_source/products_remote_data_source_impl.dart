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

    var query = _supabaseClient
        .from('products')
        .select('*, categories(*), brands(*)');

    if (requestModel.category != null) {
      query = query.eq('category_id', requestModel.category!);
    }
    if (requestModel.brand != null) {
      query = query.eq('brand_id', requestModel.brand!);
    }
    if (requestModel.discount != null) {
      query = query.gte('discountPercentage', requestModel.discount!);
    }
    if (requestModel.price != null) {
      // Assuming price can be parsed as double or handled specially. 
      // For now, doing a basic greater than or equal to check as an example.
      final priceVal = double.tryParse(requestModel.price!);
      if (priceVal != null) {
          query = query.lte('price', priceVal);
      }
    }
    if (requestModel.search != null && requestModel.search!.isNotEmpty) {
      query = query.ilike('title', '%${requestModel.search}%');
    }
    if (requestModel.popular == true) {
      query = query.gte('rating', 4.5);
    }

    if (requestModel.targetType != null && requestModel.targetOperator != null && requestModel.targetValue != null) {
      final type = requestModel.targetType!;
      final value = requestModel.targetValue!;
      switch (requestModel.targetOperator) {
        case '>=': query = query.gte(type, value); break;
        case '<=': query = query.lte(type, value); break;
        case '>': query = query.gt(type, value); break;
        case '<': query = query.lt(type, value); break;
        case '=': 
        default:
          query = query.eq(type, value); break;
      }
    }

    final response = await query.range(skip, skip + limit - 1);

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
