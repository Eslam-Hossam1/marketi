import '../../domain/entities/user_profile_entity.dart';

class UserProfileModel extends UserProfileEntity {
  UserProfileModel({
    required super.id,
    required super.name,
    required super.phone,
    required super.email,
    required super.image,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('message') && json['message'] is Map) {
      json = json['message'] as Map<String, dynamic>;
    }
    return UserProfileModel(
      id: json['id'] ?? json['_id'] ?? '',
      name: json['full_name'] ?? json['name'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      image: json['avatar_url'] ?? json['image'] ?? '',
    );
  }
}
