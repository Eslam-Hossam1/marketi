import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:dartz/dartz.dart';

import 'package:nextcart/core/errors/supabase_failures/supabase_database_failure.dart';
import 'package:nextcart/core/errors/failures.dart';
import 'package:nextcart/features/edit_profile/data/datasources/edit_profile_remote_datasource.dart';
import 'package:nextcart/features/edit_profile/data/models/edit_user_data_request_model.dart';
import 'package:nextcart/features/edit_profile/domain/params/edit_user_data_params.dart';
import 'package:nextcart/features/edit_profile/domain/repos/edit_profile_repo.dart';

class EditProfileRepoImpl implements EditProfileRepo {
  final EditProfileRemoteDataSource _remoteDataSource;

  EditProfileRepoImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, void>> editUserData(EditUserDataParams params) async {
    try {
      final requestModel = EditUserDataRequestModel.fromParams(params);
      await _remoteDataSource.editUserData(requestModel);
      return const Right(null);
    } on PostgrestException catch (e) {
      return Left(SupabaseDatabaseFailure.fromPostgrestException(e));
    } catch (e) {
      return Left(SupabaseDatabaseFailure.unknownException(unKnownExceptionMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addImage(String filePath) async {
    try {
      await _remoteDataSource.addImage(filePath);
      return const Right(null);
    } on PostgrestException catch (e) {
      return Left(SupabaseDatabaseFailure.fromPostgrestException(e));
    } catch (e) {
      return Left(SupabaseDatabaseFailure.unknownException(unKnownExceptionMsg: e.toString()));
    }
  }
}
