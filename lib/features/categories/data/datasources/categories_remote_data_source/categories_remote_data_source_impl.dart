import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:nextcart/core/models/category_model.dart';
import 'categories_remote_data_source.dart';

class CategoriesRemoteDataSourceImpl implements CategoriesRemoteDataSource {
  final SupabaseClient _supabaseClient;

  CategoriesRemoteDataSourceImpl(this._supabaseClient);

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await _supabaseClient.from('categories').select();
    return (response as List)
        .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
