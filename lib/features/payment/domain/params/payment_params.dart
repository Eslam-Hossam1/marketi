import 'package:marketi/features/cart/domain/entities/cart_entity.dart';
import 'package:marketi/features/profile/domain/entities/user_profile_entity.dart';

class PaymentParams {
  final CartEntity cart;
  final UserProfileEntity userProfile;

  PaymentParams({
    required this.cart,
    required this.userProfile,
  });
}
