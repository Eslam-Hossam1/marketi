import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/profile/domain/entities/user_profile_entity.dart';

import '../../../domain/usecases/get_user_data_use_case.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetUserDataUseCase _getUserDataUseCase;

  ProfileCubit(this._getUserDataUseCase) : super(const ProfileInitial());
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
}
