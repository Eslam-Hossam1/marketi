import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nextcart/core/helpers/dialog_helper/dialog_helper.dart';
import 'package:nextcart/core/routing/routes_paths.dart';
import 'package:nextcart/core/theme/app_text_styles.dart';
import 'package:nextcart/core/theme/theme_colors_extension.dart';
import 'package:nextcart/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import '../manager/checkout_cubit/checkout_cubit.dart';
import '../manager/checkout_cubit/checkout_state.dart';
import '../widgets/checkout_view_body.dart';
import '../widgets/processing_overlay.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    context.read<CheckoutCubit>().fetchIntent(currency: 'usd');
  }

  void _showOverlay(BuildContext context) {
    if (_overlayEntry != null) return;
    _overlayEntry = OverlayEntry(
      builder: (context) => const ProcessingOverlay(),
    );
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _hideOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: context.scaffoldBackgroundColor,
        elevation: 0,
        title: Text(
          'Checkout',
          style: AppTextStyles.bold18(context)
              .copyWith(color: context.mainTextColor),
        ),
        centerTitle: true,
      ),
      body: BlocListener<CheckoutCubit, CheckoutState>(
        listener: (context, state) {
          if (state is CheckoutProcessing) {
            _showOverlay(context);
          } else if (state is CheckoutSuccess) {
            _hideOverlay();
            context.read<CartCubit>().clearCart();
            context.push(
              RoutePaths.paymentSuccess,
              extra: context.read<CheckoutCubit>().checkoutResponse,
            );
          } else if (state is CheckoutProcessingDelay) {
            _hideOverlay();
            context.read<CartCubit>().clearCart();
            context.push(
              RoutePaths.paymentDelay,
              extra: context.read<CheckoutCubit>().checkoutResponse?.orderId,
            );
          } else if (state is CheckoutCancelled) {
            _hideOverlay();
            DialogHelper.showErrorDialog(
              context,
              errorMessage: 'Your payment was cancelled. Please try again.',
              btnOkOnPress: () => context.pop(),
            );
          } else if (state is CheckoutPaymentFailure) {
            _hideOverlay();
            DialogHelper.showErrorDialog(context, errorMessage: state.message);
          } else if (state is CheckoutFetchIntentFailure) {
            DialogHelper.showErrorDialog(
              context,
              errorMessage: state.message,
              btnOkOnPress: () => context.pop(),
            );
          } else {
            _hideOverlay();
          }
        },
        child: const CheckoutViewBody(),
      ),
    );
  }
}
