import '../../domain/entities/user_profile_entity.dart';

class UserProfileModel extends UserProfileEntity {
  UserProfileModel({
    required super.id,
    required super.name,
    required super.phone,
    required super.email,
    required super.address,
    required super.image,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('message') && json['message'] is Map) {
      json = json['message'] as Map<String, dynamic>;
    }
    return UserProfileModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      address: json['address'] ?? '',
      image: json['image'] ?? '',
    );
  }
}
