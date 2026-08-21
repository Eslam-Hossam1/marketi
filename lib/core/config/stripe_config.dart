import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class StripeConfig {
  static String get stripePublishableKey =>
      dotenv.env['STRIPE_PUBLISHABLE_KEY'] ?? '';
}
