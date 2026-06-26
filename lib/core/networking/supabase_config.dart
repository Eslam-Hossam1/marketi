import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class SupabaseConfig {
  static String get projectUrl => dotenv.env['SUPABASE_URL'] ?? '';
  static String get publishableKey => dotenv.env['SUPABASE_PUBLISHABLE_KEY'] ?? '';
}
