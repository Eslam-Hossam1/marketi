import 'package:marketi/features/payment/data/models/paymob_billing_data_model.dart';
import 'package:marketi/features/payment/data/models/paymob_product_model.dart';

abstract class PaymentService {
  Future<String> getPaymentUrl({
    required int amountCents,
    required List<PaymobProductModel> items,
    required PaymobBillingDataModel billingData,
  });
}
