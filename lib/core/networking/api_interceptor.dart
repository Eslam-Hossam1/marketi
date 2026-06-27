import 'package:nextcart/core/helpers/dialog_helper/dialog_helper.dart';
import 'package:nextcart/core/routing/app_router.dart';
import 'package:nextcart/core/routing/routes_paths.dart';
import 'api_keys.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ApiInterceptor extends Interceptor {
  final Dio client;

  ApiInterceptor({required this.client});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = Supabase.instance.client.auth.currentSession?.accessToken;
    if (token != null) {
      options.headers[ApiKeys.authorization] = "Bearer $token";
    }
    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    debugPrint(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );

    final isUnauthorized = err.response?.statusCode == 401;
    final isUserLoggedIn = Supabase.instance.client.auth.currentSession != null;

    if (isUnauthorized && isUserLoggedIn) {
      await _handleEndSession();
    }

    super.onError(err, handler);
  }

  Future<void> _handleEndSession() async {
    final navigatorState = AppRouter.rootNavigatorKey.currentState;
    final context = navigatorState?.context;

    await Supabase.instance.client.auth.signOut();

    if (context != null && (navigatorState?.mounted ?? false)) {
      DialogHelper.showEndSessionDialog(
        context,
        onDismissCallback: (_) => context.go(RoutePaths.login),
        btnOkOnPress: () => context.go(RoutePaths.login),
      );
    }
  }
}
