import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/failures.dart';
import 'package:marketi/core/usecases/use_case.dart';
import 'package:marketi/features/payment/domain/params/payment_params.dart';
import 'package:marketi/features/payment/domain/repositories/payment_repository.dart';

class RequestPaymentUseCase implements UseCase<Failure, String, PaymentParams> {
  final PaymentRepository _repository;

  RequestPaymentUseCase(this._repository);

  @override
  Future<Either<Failure, String>> call(PaymentParams params) async {
    return await _repository.getPaymentUrl(params);
  }
}
