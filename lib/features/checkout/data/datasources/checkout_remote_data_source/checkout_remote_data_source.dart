
import 'package:nextcart/features/checkout/domain/params/checkout_params.dart';

abstract class CheckoutRemoteDataSource {
  Future<Map<String, dynamic>> createCheckout(CheckoutParams params);
}
