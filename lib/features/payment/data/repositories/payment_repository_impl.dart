import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:marketi/core/errors/dio_api_failure.dart';
import 'package:marketi/core/errors/failures.dart';
import 'package:marketi/features/payment/data/datasources/payment_service.dart';
import 'package:marketi/features/payment/data/models/paymob_billing_data_model.dart';
import 'package:marketi/features/payment/data/models/paymob_product_model.dart';
import 'package:marketi/features/payment/domain/params/payment_params.dart';
import 'package:marketi/features/payment/domain/repositories/payment_repository.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  final PaymentService _paymentService;

  PaymentRepositoryImpl(this._paymentService);

  @override
  Future<Either<Failure, String>> getPaymentUrl(PaymentParams params) async {
    try {
      final billingData = PaymobBillingDataModel.fromUserProfileEntity(params.userProfile);
      final items = params.cart.products.map((p) => PaymobProductModel.fromProductEntity(p, 1)).toList();
      final totalAmountCents = items.fold(0, (sum, item) => sum + item.amountCents);
      
      final paymentUrl = await _paymentService.getPaymentUrl(
        amountCents: totalAmountCents,
        items: items,
        billingData: billingData,
      );
      
      return Right(paymentUrl);
    } catch (e) {
      log('exeption in payment repository ${e.toString()}');
      if (e is DioException) {
        return Left(DioApiFailure.fromDioException(e));
      }
      return Left(DioApiFailure.unknown(e.toString()));
    }
  }
}
