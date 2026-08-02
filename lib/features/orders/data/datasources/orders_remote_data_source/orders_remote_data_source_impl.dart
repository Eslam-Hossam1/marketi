import 'package:nextcart/core/errors/supabase_failures/supabase_edge_function_failure.dart';
import 'package:nextcart/features/orders/data/models/order_item_model.dart';
import 'package:nextcart/features/orders/data/models/order_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../domain/params/checkout_params.dart';
import 'orders_remote_data_source.dart';

class OrdersRemoteDataSourceImpl implements OrdersRemoteDataSource {
  final SupabaseClient _supabaseClient;

  OrdersRemoteDataSourceImpl(this._supabaseClient);

  @override
  Future<Map<String, dynamic>> createCheckout(CheckoutParams params) async {
    try {
      final response = await _supabaseClient.functions.invoke(
        'create-payment-intent',
        body: params.toJson(),
      );

      if (response.status != 200) {
        final errorMsg =
            response.data['error'] ?? 'Unknown edge function error';
        throw FunctionException(
          status: response.status,
          details: response.data,
          reasonPhrase: errorMsg,
        );
      }

      return response.data as Map<String, dynamic>;
    } on FunctionException catch (e) {
      throw SupabaseEdgeFunctionFailure.fromFunctionException(e);
    } catch (e) {
      throw SupabaseEdgeFunctionFailure.unknownException(
        unKnownExceptionMsg: e.toString(),
      );
    }
  }

  @override
  Future<List<OrderModel>> getOrders() async {
    final user = _supabaseClient.auth.currentUser;
    if (user == null) throw const AuthException('Not authenticated');

    final response = await _supabaseClient
        .from('orders')
        .select()
        .eq('user_id', user.id)
        .order('created_at', ascending: false);

    return (response as List).map((json) => OrderModel.fromJson(json)).toList();
  }

  @override
  Future<Map<String, dynamic>> getOrderDetails(String orderId) async {
    final user = _supabaseClient.auth.currentUser;
    if (user == null) throw const AuthException('Not authenticated');

    final orderResponse = await _supabaseClient
        .from('orders')
        .select()
        .eq('id', orderId)
        .eq('user_id', user.id)
        .single();

    final itemsResponse = await _supabaseClient
        .from('order_items')
        .select()
        .eq('order_id', orderId);

    return {
      'order': OrderModel.fromJson(orderResponse),
      'items': (itemsResponse as List)
          .map((json) => OrderItemModel.fromJson(json))
          .toList(),
    };
  }
}
