import 'package:marketi/core/helpers/dialog_helper/dialog_helper.dart';
import 'package:marketi/core/routing/app_router.dart';
import 'package:marketi/core/routing/routes_paths.dart';
import 'package:marketi/core/services/auth_credentials_manager/auth_credentials_manager.dart';
import 'api_keys.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

class ApiInterceptor extends Interceptor {
  final Dio client;
  final AuthCredentialsManager authCredentialsManager;

  ApiInterceptor({required this.client, required this.authCredentialsManager});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = authCredentialsManager.accessToken;
    options.headers[ApiKeys.authorization] = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiSGFuZWVuIiwic3ViIjoiMyIsInBob25lX251bWJlciI6IisyMDEwMjI2MjMzMTAiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJCYXNpYyBBZG1pbiIsImV4cCI6MTc3NDUyNDU3NSwiaXNzIjoiRGtQb3J0YWwiLCJhdWQiOiJEa1BvcnRhbFVzZXJzIn0.LLBh1PErdjFGLVjcdW9IJPpi3XHnDxHekjJY-TQXito";

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
    final isUserLoggedIn = authCredentialsManager.userIsAuthenticated();

    if (isUnauthorized && isUserLoggedIn) {
      _handleEndSession();
    }

    super.onError(err, handler);
  }

  void _handleEndSession() {
    authCredentialsManager.clearTokens();

    final context = AppRouter.rootNavigatorKey.currentState?.context;
    if (context != null) {
      DialogHelper.showEndSessionDialog(
        context,
        onDismissCallback: (_) => context.go(RoutePaths.login),
        btnOkOnPress: () => context.go(RoutePaths.login),
      );
    }
  }
}
