import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextcart/core/extensions/responsive_extension.dart';
import '../manager/checkout_cubit/checkout_cubit.dart';
import '../manager/checkout_cubit/checkout_state.dart';
import 'checkout_pay_button.dart';
import 'checkout_summary_section.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        if (state is CheckoutFetchingIntent || state is CheckoutInitial) {
          return const Center(child: CircularProgressIndicator());
        }

        final response = context.read<CheckoutCubit>().checkoutResponse;
        if (response == null) return const SizedBox.shrink();

        return SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(16.w(context)),
                  child: CheckoutSummarySection(response: response),
                ),
              ),
              CheckoutPayButton(
                isLoading: state is CheckoutPaymentSheetLoading,
                onPressed: () => context.read<CheckoutCubit>().pay(),
              ),
            ],
          ),
        );
      },
    );
  }
}
