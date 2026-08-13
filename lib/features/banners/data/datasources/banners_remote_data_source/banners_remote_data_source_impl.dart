import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:nextcart/features/banners/data/models/banner_model.dart';
import 'banners_remote_data_source.dart';

class BannersRemoteDataSourceImpl implements BannersRemoteDataSource {
  final SupabaseClient _supabaseClient;

  BannersRemoteDataSourceImpl(this._supabaseClient);

  @override
  Future<List<BannerModel>> getBanners() async {
    final now = DateTime.now().toUtc().toIso8601String();
    
    final response = await _supabaseClient
        .from('banners')
        .select()
        .eq('is_active', true)
        .lte('start_at', now)
        .or('end_at.is.null,end_at.gte.$now')
        .order('sort_order', ascending: true);

    return (response as List)
        .map((e) => BannerModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
