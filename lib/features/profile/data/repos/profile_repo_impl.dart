import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:nextcart/core/errors/supabase_failures/supabase_database_failure.dart';
import 'package:dartz/dartz.dart';


import '../../../../core/errors/api_failure.dart';

import '../../domain/entities/user_profile_entity.dart';
import '../../domain/repos/profile_repo.dart';
import '../datasources/profile_remote_data_source.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ProfileRemoteDataSource _remoteDataSource;

  ProfileRepoImpl(this._remoteDataSource);

  @override
  Future<Either<ApiFailure, UserProfileEntity>> getUserData() async {
    try {
      final userProfileModel = await _remoteDataSource.getUserData();
      return Right(userProfileModel);
    } on PostgrestException catch (e) {
      return Left(SupabaseDatabaseFailure.fromPostgrestException(e));
    } catch (e) {
      return Left(SupabaseDatabaseFailure.unknownException(unKnownExceptionMsg: e.toString()));
    }
  }
}
