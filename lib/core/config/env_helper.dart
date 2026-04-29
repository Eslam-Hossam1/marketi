import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class EnvHelper {
  static String get paymobSecretKey => dotenv.env['PAYMOB_SECRET_KEY']!;
  static String get paymobPublicKey => dotenv.env['PAYMOB_PUBLIC_KEY']!;
  static String get paymobCardIntegrationId => dotenv.env['PAYMOB_CARD_INTEGRATION_ID']!;
}
