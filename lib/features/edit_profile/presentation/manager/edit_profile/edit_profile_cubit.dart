import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marketi/core/di/service_locator.dart';
import 'package:marketi/core/services/image_picker_service/cropped_image_picker_service.dart';
import 'package:marketi/features/edit_profile/domain/params/edit_user_data_params.dart';
import 'package:marketi/features/edit_profile/domain/usecases/add_image_use_case.dart';
import 'package:marketi/features/edit_profile/domain/usecases/edit_user_data_use_case.dart';
import 'package:marketi/features/profile/domain/entities/user_profile_entity.dart';
import 'package:marketi/features/edit_profile/presentation/manager/edit_profile/edit_profile_form_data.dart';
import 'package:marketi/features/edit_profile/presentation/manager/edit_profile/edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final EditUserDataUseCase _editUserDataUseCase;
  final AddImageUseCase _addImageUseCase;
  final UserProfileEntity userProfile;

  EditProfileCubit(
    this._editUserDataUseCase,
    this._addImageUseCase,
    this.userProfile,
  ) : super(const EditProfileInitial()) {
    formData.name = userProfile.name;
    formData.phone = userProfile.phone;
    formData.address = userProfile.address;
  }

  final EditProfileFormData formData = EditProfileFormData();
  File? imageFile;

  Future<void> pickProfileImage({required ImageSource imageSource}) async {
    final croppedFile = await getIt<CroppedImagePickerService>()
        .pickSquareCroppedImage(imageSource: imageSource);
    if (croppedFile != null) {
      imageFile = File(croppedFile.path);
      formData.newImageFilePath = croppedFile.path;
      emit(const EditProfileImagePicked());
    }
  }

  Future<void> updateProfile(UserProfileEntity userProfile) async {
    final bool infoChanged =
        formData.name != userProfile.name ||
        formData.phone != userProfile.phone ||
        formData.address != userProfile.address;
    final bool imageChanged = formData.newImageFilePath != null;
    if (!infoChanged && !imageChanged) {
      emit(const EditProfileNoChanges());
      return;
    }

    emit(const EditProfileLoading());

    // if he changed so don't pass this field and do the add image request
    // if user not changed it pass the same image url
    final params = EditUserDataParams(
      name: formData.name,
      phone: formData.phone,
      address: formData.address,
      image: imageChanged ? null : userProfile.image,
    );

    if (imageChanged) {
      final imageResult = await _addImageUseCase.call(formData.newImageFilePath!);
      imageResult.fold(
        (failure) {
          emit(EditProfileFailure(failure.errMsg));
        },
        (_) async {
          // Then update user data (without image field)
          final dataResult = await _editUserDataUseCase.call(params);
          dataResult.fold(
            (failure) => emit(EditProfileFailure(failure.errMsg)),
            (_) => emit(const EditProfileSuccess()),
          );
        },
      );
    } else {
      // Just update user data with original image
      final result = await _editUserDataUseCase(params);
      result.fold(
        (failure) => emit(EditProfileFailure(failure.errMsg)),
        (_) => emit(const EditProfileSuccess()),
      );
    }
  }
}
