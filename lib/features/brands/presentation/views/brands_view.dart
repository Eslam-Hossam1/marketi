import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/di/service_locator.dart';
import 'package:marketi/features/brands/domain/usecases/get_brands_use_case.dart';
import '../manager/brands_cubit/brands_cubit.dart';
import '../widgets/brands_view_body.dart';

class BrandsView extends StatelessWidget {
  const BrandsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BrandsCubit(getIt<GetBrandsUseCase>())..getBrands(),
      child: const Scaffold(
        body: SafeArea(
          child: BrandsViewBody(),
        ),
      ),
    );
  }
}
