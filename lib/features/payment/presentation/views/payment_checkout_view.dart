import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/di/service_locator.dart';
import 'package:marketi/core/widgets/custom_circular_progress_indecator.dart';
import 'package:marketi/features/payment/domain/params/payment_params.dart';
import 'package:marketi/features/payment/presentation/manager/payment_cubit/payment_cubit.dart';
import 'package:marketi/features/payment/presentation/manager/payment_cubit/payment_state.dart';
import 'package:marketi/features/payment/presentation/views/checkout_view.dart';

class PaymentCheckoutView extends StatelessWidget {
  final PaymentParams params;

  const PaymentCheckoutView({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PaymentCubit>()..getPaymentUrl(params),
      child: BlocBuilder<PaymentCubit, PaymentState>(
        builder: (context, state) {
          if (state is PaymentLoading) {
            return Scaffold(
              appBar: AppBar(title: const Text('Checkout')),
              body: const Center(child: CustomCircularProgressIndecator()),
            );
          } else if (state is PaymentUrlSuccess) {
            return CheckoutWebView(paymentUrl: state.paymentUrl, params: params);
          } else if (state is PaymentFailure) {
            return Scaffold(
              appBar: AppBar(title: const Text('Checkout Error')),
              body: Center(
                child: Text('Error: ${state.errMessage}'),
              ),
            );
          }
          return Scaffold(
            appBar: AppBar(title: const Text('Checkout')),
            body: const Center(child: CustomCircularProgressIndecator()),
          );
        },
      ),
    );
  }
}
