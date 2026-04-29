import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/routing/routes_paths.dart';

class PaymentFailureView extends StatelessWidget {
  const PaymentFailureView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, color: Colors.red, size: 100),
            const SizedBox(height: 20),
            const Text(
              'Payment Failed!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text('Something went wrong with your payment.'),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => context.pop(),
              child: const Text('Try Again'),
            ),
            TextButton(
              onPressed: () => context.go(RoutePaths.home),
              child: const Text('Go to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
