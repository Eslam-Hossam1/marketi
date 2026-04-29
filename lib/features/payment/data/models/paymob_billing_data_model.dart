import 'package:marketi/features/profile/domain/entities/user_profile_entity.dart';

class PaymobBillingDataModel {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String apartment;
  final String floor;
  final String street;
  final String building;
  final String city;
  final String country;
  final String state;

  PaymobBillingDataModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    this.apartment = "NA",
    this.floor = "NA",
    this.street = "NA",
    this.building = "NA",
    this.city = "NA",
    this.country = "NA",
    this.state = "NA",
  });

  factory PaymobBillingDataModel.fromUserProfileEntity(UserProfileEntity entity) {
    final names = entity.name.split(' ');
    return PaymobBillingDataModel(
      firstName: names.first,
      lastName: names.length > 1 ? names.sublist(1).join(' ') : names.first,
      email: entity.email,
      phoneNumber: entity.phone,
      street: entity.address,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone_number': phoneNumber,
      'apartment': apartment,
      'floor': floor,
      'street': street,
      'building': building,
      'city': city,
      'country': country,
      'state': state,
    };
  }
}
