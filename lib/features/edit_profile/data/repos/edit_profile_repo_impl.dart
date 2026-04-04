import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:marketi/core/errors/dio_api_failure.dart';
import 'package:marketi/core/errors/failures.dart';
import 'package:marketi/features/edit_profile/data/datasources/edit_profile_remote_datasource.dart';
import 'package:marketi/features/edit_profile/data/models/edit_user_data_request_model.dart';
import 'package:marketi/features/edit_profile/domain/params/edit_user_data_params.dart';
import 'package:marketi/features/edit_profile/domain/repos/edit_profile_repo.dart';

class EditProfileRepoImpl implements EditProfileRepo {
  final EditProfileRemoteDataSource _remoteDataSource;

  EditProfileRepoImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, void>> editUserData(EditUserDataParams params) async {
    try {
      final requestModel = EditUserDataRequestModel.fromParams(params);
      await _remoteDataSource.editUserData(requestModel);
      return const Right(null);
    } on DioException catch (e) {
      return Left(DioApiFailure.fromDioException(e));
    } catch (e) {
      return Left(DioApiFailure.unknownException(unKnownExceptionMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addImage(String filePath) async {
    try {
      await _remoteDataSource.addImage(filePath);
      return const Right(null);
    } on DioException catch (e) {
      return Left(DioApiFailure.fromDioException(e));
    } catch (e) {
      return Left(DioApiFailure.unknownException(unKnownExceptionMsg: e.toString()));
    }
  }
}
