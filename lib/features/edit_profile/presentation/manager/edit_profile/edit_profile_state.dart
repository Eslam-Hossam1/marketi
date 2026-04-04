abstract class EditProfileState {
  const EditProfileState();
}

class EditProfileInitial extends EditProfileState {
  const EditProfileInitial();
}

class EditProfileLoading extends EditProfileState {
  const EditProfileLoading();
}

class EditProfileSuccess extends EditProfileState {
  const EditProfileSuccess();
}

class EditProfileFailure extends EditProfileState {
  final String message;
  const EditProfileFailure(this.message);
}
class EditProfileImagePicked extends EditProfileState {
  const EditProfileImagePicked();
}

class EditProfileNoChanges extends EditProfileState {
  const EditProfileNoChanges();
}
