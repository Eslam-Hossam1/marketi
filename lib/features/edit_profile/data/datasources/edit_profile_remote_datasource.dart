import 'package:dio/dio.dart';
import 'package:marketi/core/networking/api_consumer.dart';
import 'package:marketi/core/networking/end_points.dart';
import 'package:marketi/features/edit_profile/data/models/edit_user_data_request_model.dart';

abstract class EditProfileRemoteDataSource {
  Future<void> editUserData(EditUserDataRequestModel requestModel);
  Future<void> addImage(String filePath);
}

class EditProfileRemoteDataSourceImpl implements EditProfileRemoteDataSource {
  final ApiConsumer _apiConsumer;

  EditProfileRemoteDataSourceImpl(this._apiConsumer);

  @override
  Future<void> editUserData(EditUserDataRequestModel requestModel) async {
    await _apiConsumer.post(
      EndPoints.editUserData,
      data: requestModel.toJson(),
    );
  }

  @override
  Future<void> addImage(String filePath) async {
    await _apiConsumer.post(
      EndPoints.addImage,
      data: {'file': await MultipartFile.fromFile(filePath)},
      isFromData: true,
    );
  }
}
