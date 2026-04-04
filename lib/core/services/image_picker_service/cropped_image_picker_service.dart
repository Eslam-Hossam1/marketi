import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class CroppedImagePickerService {
  final ImagePicker _imagePicker;
  final ImageCropper _imageCropper;

  const CroppedImagePickerService(this._imagePicker, this._imageCropper);

  Future<CroppedFile?> pickSquareCroppedImage({
    required ImageSource imageSource,
  }) async {
    return _pickCustomCroppedImage(
      imageSource: imageSource,
      cropFunction: cropSquareImage,
    );
  }

  Future<CroppedFile?> pickRatioFreeCroppedImage({
    required ImageSource imageSource,
  }) async {
    return _pickCustomCroppedImage(
      imageSource: imageSource,
      cropFunction: freeRatioCroppingImage,
    );
  }

  Future<CroppedFile?> _pickCustomCroppedImage({
    required ImageSource imageSource,
    required Future<CroppedFile?> Function(File file) cropFunction,
  }) async {
    final pickedImage = await _imagePicker.pickImage(source: imageSource);
    if (pickedImage == null) return null;

    final file = File(pickedImage.path);
    return cropFunction(file);
  }

  Future<CroppedFile?> freeRatioCroppingImage(File imageFile) async {
    return await _imageCropper.cropImage(
      sourcePath: imageFile.path,
      compressFormat: ImageCompressFormat.jpg,
    );
  }

  Future<CroppedFile?> cropSquareImage(File imageFile) async {
    return await _imageCropper.cropImage(
      sourcePath: imageFile.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      compressFormat: ImageCompressFormat.jpg,
      uiSettings: [
        AndroidUiSettings(
          lockAspectRatio: true,
        ),
        IOSUiSettings(
          aspectRatioLockEnabled: true,
        ),
      ],
    );
  }
}
