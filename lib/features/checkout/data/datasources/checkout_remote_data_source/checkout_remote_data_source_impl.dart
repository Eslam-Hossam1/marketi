import 'package:nextcart/core/errors/supabase_failures/supabase_edge_function_failure.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../models/checkout_response_model.dart';
import '../../../domain/params/checkout_params.dart';
import 'checkout_remote_data_source.dart';

class CheckoutRemoteDataSourceImpl implements CheckoutRemoteDataSource {
  final SupabaseClient _supabaseClient;

  CheckoutRemoteDataSourceImpl(this._supabaseClient);

  @override
  Future<CheckoutResponseModel> createCheckout(CheckoutParams params) async {
    try {
      final response = await _supabaseClient.functions.invoke(
        'create-payment-intent',
        body: {'currency': params.currency},
      );

      if (response.status != 200) {
        throw SupabaseEdgeFunctionFailure(
          'create_checkout_error',
          response.status.toString(),
          response.data?['error'] ?? 'Unknown error',
          response.data?['error'] ?? 'Failed to create checkout',
        );
      }

      return CheckoutResponseModel.fromJson(response.data as Map<String, dynamic>);
    } on FunctionException catch (e) {
      throw SupabaseEdgeFunctionFailure(
        'create_checkout_error',
        e.status.toString(),
        e.details?['error'] ?? 'Unknown error',
        'Failed to create checkout',
      );
    }
  }
}

