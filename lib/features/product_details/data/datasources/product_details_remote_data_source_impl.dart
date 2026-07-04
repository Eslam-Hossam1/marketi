import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/params/product_details_params.dart';
import '../models/product_details_model.dart';
import 'product_details_remote_data_source.dart';

class ProductDetailsRemoteDataSourceImpl
    implements ProductDetailsRemoteDataSource {
  final SupabaseClient _supabaseClient;

  ProductDetailsRemoteDataSourceImpl(this._supabaseClient);

  @override
  Future<ProductDetailsModel> getProductDetails(
      ProductDetailsParams params) async {
    final response = await _supabaseClient
        .from('products')
        .select('*, categories(*), brands(*)')
        .eq('id', params.productId)
        .single();
        
    return ProductDetailsModel.fromJson(response);
  }
}
