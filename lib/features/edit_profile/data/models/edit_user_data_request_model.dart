import 'package:marketi/features/edit_profile/domain/params/edit_user_data_params.dart';

class EditUserDataRequestModel extends EditUserDataParams {
  EditUserDataRequestModel({
    required super.name,
    required super.phone,
    required super.address,
    super.image,
  });

  factory EditUserDataRequestModel.fromParams(EditUserDataParams params) {
    return EditUserDataRequestModel(
      name: params.name,
      phone: params.phone,
      address: params.address,
      image: params.image,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'name': name,
      'phone': phone,
      'address': address,
    };
    if (image != null) {
      data['image'] = image;
    }
    return data;
  }
}
