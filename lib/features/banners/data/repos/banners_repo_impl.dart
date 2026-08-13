import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:nextcart/core/errors/api_failure.dart';
import 'package:nextcart/core/errors/supabase_failures/supabase_database_failure.dart';
import 'package:nextcart/features/banners/domain/entities/banner_entity.dart';
import 'package:nextcart/features/banners/domain/repos/banners_repo.dart';
import '../datasources/banners_remote_data_source/banners_remote_data_source.dart';

class BannersRepoImpl implements BannersRepo {
  final BannersRemoteDataSource _remoteDataSource;

  BannersRepoImpl(this._remoteDataSource);

  @override
  Future<Either<ApiFailure, List<BannerEntity>>> getBanners() async {
    try {
      final banners = await _remoteDataSource.getBanners();
      return Right(banners);
    } catch (e) {
      if (e is PostgrestException) {
        return Left(SupabaseDatabaseFailure.fromPostgrestException(e));
      }
      return Left(SupabaseDatabaseFailure.unknownException(
          unKnownExceptionMsg: e.toString()));
    }
  }
}
