import '../repos/edit_profile_repo.dart';

class DeleteImageUseCase {
  final EditProfileRepo _repo;

  DeleteImageUseCase(this._repo);

  Future<void> call(String imageUrl) {
    return _repo.deleteImage(imageUrl);
  }
}
