import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:nextcart/core/models/brand_model.dart';
import 'brands_remote_data_source.dart';

class BrandsRemoteDataSourceImpl implements BrandsRemoteDataSource {
  final SupabaseClient _supabaseClient;

  BrandsRemoteDataSourceImpl(this._supabaseClient);

  @override
  Future<List<BrandModel>> getBrands() async {
    final response = await _supabaseClient.from('brands').select();
    return (response as List)
        .map((e) => BrandModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
