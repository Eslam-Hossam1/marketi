
import 'package:nextcart/features/checkout/data/models/checkout_response_model.dart';
import 'package:nextcart/features/checkout/domain/params/checkout_params.dart';

abstract class CheckoutRemoteDataSource {
  Future<CheckoutResponseModel> createCheckout(CheckoutParams params);
}
