import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextcart/features/profile/domain/entities/user_profile_entity.dart';

import '../../../../auth/domain/usecases/logout_use_case.dart';
import '../../../domain/usecases/get_user_data_use_case.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetUserDataUseCase _getUserDataUseCase;
  final LogoutUseCase _logoutUseCase;

  ProfileCubit(this._getUserDataUseCase, this._logoutUseCase)
      : super(const ProfileInitial());
  UserProfileEntity? userProfile;
  Future<void> getUserData() async {
    emit(const ProfileLoading());
    final result = await _getUserDataUseCase();
    result.fold(
      (failure) =>
          emit(ProfileError(failure.serverErrorMessage ?? failure.errMsg)),
      (userProfile) {
        this.userProfile = userProfile;
        emit(const ProfileLoaded());
      },
    );
  }

  Future<void> logout() async {
    emit(const ProfileLogoutLoading());
    final result = await _logoutUseCase();
    result.fold(
      (failure) => emit(ProfileLogoutError(failure.serverErrorMessage ?? failure.errMsg)),
      (_) => emit(const ProfileLogoutSuccess()),
    );
  }
}
