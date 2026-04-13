import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/failures.dart';
import 'package:marketi/core/usecases/use_case.dart';
import '../entities/product_details_entity.dart';
import '../params/product_details_params.dart';
import '../repos/product_details_repo.dart';

class GetProductDetailsUseCase
    implements UseCase<Failure, ProductDetailsEntity, ProductDetailsParams> {
  final ProductDetailsRepo repo;

  const GetProductDetailsUseCase(this.repo);

  @override
  Future<Either<Failure, ProductDetailsEntity>> call(
      ProductDetailsParams params) async {
    return await repo.getProductDetails(params);
  }
}
