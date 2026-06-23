import 'package:dartz/dartz.dart';
import 'package:nexcart/core/errors/failures.dart';

abstract class UseCase<FailureType extends Failure, Entity, Params> {
  Future<Either<FailureType, Entity>> call(Params params);
}

abstract class NoParamUseCase<FailureType extends Failure, Entity> {
  Future<Either<FailureType, Entity>> call();
}
