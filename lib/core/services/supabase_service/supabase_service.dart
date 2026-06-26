import 'package:supabase_flutter/supabase_flutter.dart';

import '../../networking/supabase_config.dart';
import '../../networking/supabase_logger_client.dart';

class SupabaseService {
  SupabaseService._();

  static Future<void> initialize() async {
    await Supabase.initialize(
      url: SupabaseConfig.projectUrl,
      publishableKey: SupabaseConfig.publishableKey,
      httpClient: SupabaseLoggerClient(),
    );
  }

  static SupabaseClient get client => Supabase.instance.client;
}
