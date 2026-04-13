import '../../../domain/entities/product_details_entity.dart';

abstract class ProductDetailsState {}

class ProductDetailsInitial extends ProductDetailsState {}

class ProductDetailsLoading extends ProductDetailsState {}

class ProductDetailsSuccess extends ProductDetailsState {
  final ProductDetailsEntity productDetails;

  ProductDetailsSuccess(this.productDetails);
}

class ProductDetailsFailure extends ProductDetailsState {
  final String errorMessage;

  ProductDetailsFailure(this.errorMessage);
}
