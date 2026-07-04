import '../../../domain/entities/user_profile_entity.dart';

abstract class ProfileState {
  const ProfileState();
}

class ProfileInitial extends ProfileState {
  const ProfileInitial();
}

class ProfileLoading extends ProfileState {
  const ProfileLoading();
}

class ProfileLoaded extends ProfileState {
  const ProfileLoaded();
}

class ProfileError extends ProfileState {
  final String message;

  const ProfileError(this.message);
}

class ProfileLogoutLoading extends ProfileState {
  const ProfileLogoutLoading();
}

class ProfileLogoutSuccess extends ProfileState {
  const ProfileLogoutSuccess();
}

class ProfileLogoutError extends ProfileState {
  final String message;

  const ProfileLogoutError(this.message);
}
