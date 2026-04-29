import 'package:dio/dio.dart';
import 'package:marketi/core/config/env_helper.dart';
import 'package:marketi/features/payment/data/datasources/payment_service.dart';
import 'package:marketi/features/payment/data/models/paymob_billing_data_model.dart';
import 'package:marketi/features/payment/data/models/paymob_product_model.dart';

class PaymobServiceImpl implements PaymentService {
  final Dio _dio;
  static const String _baseUrl = "https://accept.paymob.com/";

  PaymobServiceImpl(this._dio);

  @override
  Future<String> getPaymentUrl({
    required int amountCents,
    required List<PaymobProductModel> items,
    required PaymobBillingDataModel billingData,
  }) async {
    final response = await _dio.post(
      "${_baseUrl}v1/intention/",
      options: Options(
        headers: {"Authorization": "Token ${EnvHelper.paymobSecretKey}"},
        contentType: "application/json",
      ),
      data: {
        "amount": amountCents,
        "currency": "EGP",
        "payment_methods": [
          int.parse(EnvHelper.paymobCardIntegrationId),
        ],
        "items": items.map((e) => e.toJson()).toList(),
        "billing_data": billingData.toJson(),
        "expiration": 3600,
      },
    );

    final clientSecret = response.data["client_secret"];
    final publicKey = EnvHelper.paymobPublicKey;

    return "https://accept.paymob.com/unifiedcheckout/?publicKey=$publicKey&clientSecret=$clientSecret";
  }
}
