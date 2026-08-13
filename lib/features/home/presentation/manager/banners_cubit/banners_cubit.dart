import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextcart/core/params/product_params.dart';
import 'package:nextcart/core/routing/routing_helper.dart';
import 'package:nextcart/features/banners/domain/entities/banner_entity.dart';
import 'package:nextcart/features/banners/domain/usecases/get_banners_use_case.dart';
import 'banners_state.dart';

class BannersCubit extends Cubit<BannersState> {
  final GetBannersUseCase _getBannersUseCase;

  BannersCubit(this._getBannersUseCase) : super(const BannersInitial());

  Future<void> getBanners() async {
    emit(const BannersLoading());
    final result = await _getBannersUseCase();
    result.fold(
      (failure) => emit(BannersError(failure.serverErrorMessage ?? failure.errMsg)),
      (banners) => emit(BannersLoaded(banners)),
    );
  }

  void onBannerTapped(BannerEntity banner, BuildContext context) {
    if (banner.targetType == 'product_id') {
      RoutingHelper.pushProductDetails(context, productId: banner.targetValue);
    } else {
      RoutingHelper.pushProducts(context, params: ProductParams(
        targetType: banner.targetType,
        targetOperator: banner.targetOperator,
        targetValue: banner.targetValue,
      ), title: banner.title);
    }
  }
}
