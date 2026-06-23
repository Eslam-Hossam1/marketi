import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/routing/routes_paths.dart';
import 'package:marketi/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:marketi/features/orders/domain/entities/order_entity.dart';
import 'package:marketi/features/orders/domain/params/add_order_params.dart';
import 'package:marketi/features/orders/presentation/manager/orders_cubit/orders_cubit.dart';
import 'package:marketi/features/payment/domain/params/payment_params.dart';
import 'package:marketi/core/di/service_locator.dart';
import 'package:marketi/core/widgets/custom_circular_progress_indecator.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CheckoutWebView extends StatefulWidget {
  final String paymentUrl;
  final PaymentParams params;

  const CheckoutWebView({super.key, required this.paymentUrl, required this.params});

  @override
  State<CheckoutWebView> createState() => _CheckoutWebViewState();
}

class _CheckoutWebViewState extends State<CheckoutWebView> {
  late final WebViewController _controller;
  bool _isHandled = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            debugPrint('WebView onPageStarted: $url');
            _handleUrl(url);
          },
          onNavigationRequest: (NavigationRequest request) {
            debugPrint('WebView onNavigationRequest: ${request.url}');
            if (_handleUrl(request.url)) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
          onUrlChange: (UrlChange change) {
            debugPrint('WebView onUrlChange: ${change.url}');
            if (change.url != null) {
              _handleUrl(change.url!);
            }
          },
          onPageFinished: (url) {
            setState(() {
              _isLoading = false;
            });
          },
        ),
      )
      ..loadRequest(
        Uri.parse(widget.paymentUrl),
      );
  }

  bool _handleUrl(String url) {
    if (_isHandled) return true;

    final isCallback = url.contains('marketi-app.com/payment-callback');
    final isSuccess = url.contains('success=true');
    final isFailure = url.contains('success=false');

    if (isCallback || isSuccess || isFailure) {
      debugPrint('WebView _handleUrl detected result URL: $url');
      
      try {
        if (isFailure) {
          debugPrint('WebView _handleUrl: Navigating to Failure');
          _isHandled = true;
          Future.delayed(Duration.zero, () {
            if (mounted) context.pushReplacement(RoutePaths.paymentFailure);
          });
          return true;
        }
        
        if (isCallback || isSuccess) {
          debugPrint('WebView _handleUrl: Navigating to Success');
          _isHandled = true;
          _saveOrder();
          context.read<CartCubit>().clearCart();
          Future.delayed(Duration.zero, () {
            if (mounted) context.pushReplacement(RoutePaths.paymentSuccess);
          });
          return true;
        }
      } catch (e, stack) {
        debugPrint('WebView _handleUrl ERROR: $e');
        debugPrint(stack.toString());
      }
    }
    return false;
  }

  void _saveOrder() {
    debugPrint('WebView _saveOrder starting...');
    try {
      final order = OrderEntity(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        products: List.from(widget.params.cart.products),
        totalPrice: widget.params.cart.products.fold(0.0, (sum, p) => sum + p.price),
        orderDate: DateTime.now(),
      );
      
      // Use getIt instead of context.read to avoid route scope issues
      getIt<OrdersCubit>().addOrder(AddOrderParams(order: order));
      debugPrint('WebView _saveOrder: Order added to Hive');
    } catch (e) {
      debugPrint('WebView _saveOrder ERROR: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_isLoading)
            const Center(child: CustomCircularProgressIndecator()),
        ],
      ),
    );
  }
}
