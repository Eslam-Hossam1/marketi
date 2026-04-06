import 'package:marketi/core/networking/end_points.dart';

import '../../../../core/networking/api_consumer.dart';
import '../models/user_profile_model.dart';
import 'profile_remote_data_source.dart';

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ApiConsumer _apiConsumer;

  ProfileRemoteDataSourceImpl(this._apiConsumer);

  @override
  Future<UserProfileModel> getUserData() async {
    final response = await _apiConsumer.get(EndPoints.userData);
    return UserProfileModel.fromJson(response);
  }
}
