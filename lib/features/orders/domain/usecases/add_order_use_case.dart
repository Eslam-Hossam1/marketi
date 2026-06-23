import 'package:dartz/dartz.dart';
import 'package:marketi/core/errors/failures.dart';
import 'package:marketi/core/usecases/use_case.dart';
import '../params/add_order_params.dart';
import '../repos/orders_repo.dart';

class AddOrderUseCase extends UseCase<Failure, void, AddOrderParams> {
  final OrdersRepo _ordersRepo;

  AddOrderUseCase(this._ordersRepo);

  @override
  Future<Either<Failure, void>> call(AddOrderParams params) {
    return _ordersRepo.addOrder(params);
  }
}
