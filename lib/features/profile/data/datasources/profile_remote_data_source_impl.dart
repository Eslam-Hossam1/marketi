import 'package:marketi/core/networking/end_points.dart';

import '../../../../core/networking/api_consumer.dart';
import '../models/user_profile_model.dart';
import 'profile_remote_data_source.dart';

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ApiConsumer _apiConsumer;

  ProfileRemoteDataSourceImpl(this._apiConsumer);

  @override
  Future<UserProfileModel> getUserData() async {
  //   final response = await _apiConsumer.get(EndPoints.userData);
  //   return UserProfileModel.fromJson(response);
  // }
      await Future.delayed(const Duration(seconds: 1)); // Simulate network latency

    final fakeResponse = {
      "message": {
        "_id": "65f1a2b3c4d5e6f7g8h9",
        "name": "Billie Eilish",
        "phone": "+201234567890",
        "email": "@BillieEilish",
        "address": "Los Angeles, California",
        "image": "https://static.wikia.nocookie.net/gracieabrams/images/3/39/Billie_Eilish.jpeg/revision/latest?cb=20250318232144",
      }
    };

    return UserProfileModel.fromJson(fakeResponse);

    // Uncomment when ready for actual API integration
    // final response = await _apiConsumer.get(EndPoints.userData);
    // return UserProfileModel.fromJson(response);
  }
}
