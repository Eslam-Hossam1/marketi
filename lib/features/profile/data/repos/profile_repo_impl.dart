import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/api_failure.dart';
import '../../../../core/errors/dio_api_failure.dart';
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
    } on DioException catch (e) {
      return Left(DioApiFailure.fromDioException(e));
    } catch (e) {
      return Left(
        DioApiFailure.unknownException(unKnownExceptionMsg: e.toString()),
      );
    }
  }
}
