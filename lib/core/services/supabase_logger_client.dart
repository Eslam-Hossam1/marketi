import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class SupabaseLoggerClient extends http.BaseClient {
  final http.Client _inner = http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    _printRequest(request);

    final startTime = DateTime.now();
    try {
      final response = await _inner.send(request);
      final endTime = DateTime.now();
      final duration = endTime.difference(startTime).inMilliseconds;

      return _printResponse(response, duration);
    } catch (e) {
      _printError(request, e);
      rethrow;
    }
  }

  void _printRequest(http.BaseRequest request) {
    debugPrint('╭─────────────────────────────────────────────────────────────────');
    debugPrint('│ 🌐 REQUEST: ${request.method} ${request.url}');
    debugPrint('│ ────────────────────────────────────────────────────────────────');
    
    if (request.headers.isNotEmpty) {
      debugPrint('│ Headers:');
      request.headers.forEach((key, value) {
        debugPrint('│   $key: $value');
      });
    }

    if (request is http.Request) {
      if (request.body.isNotEmpty) {
        debugPrint('│ Body:');
        _printPrettyJson(request.body);
      }
    }
    debugPrint('╰─────────────────────────────────────────────────────────────────');
  }

  Future<http.StreamedResponse> _printResponse(
      http.StreamedResponse response, int durationMs) async {
    final responseBytes = await response.stream.toBytes();
    final responseString = utf8.decode(responseBytes);

    debugPrint('╭─────────────────────────────────────────────────────────────────');
    debugPrint('│ ${response.statusCode >= 200 && response.statusCode < 300 ? "🟢" : "🔴"} RESPONSE: [${response.statusCode}] ${response.request?.url} ($durationMs ms)');
    debugPrint('│ ────────────────────────────────────────────────────────────────');

    if (responseString.isNotEmpty) {
      debugPrint('│ Body:');
      _printPrettyJson(responseString);
    }
    debugPrint('╰─────────────────────────────────────────────────────────────────');

    return http.StreamedResponse(
      Stream.fromIterable([responseBytes]),
      response.statusCode,
      contentLength: response.contentLength,
      request: response.request,
      headers: response.headers,
      isRedirect: response.isRedirect,
      persistentConnection: response.persistentConnection,
      reasonPhrase: response.reasonPhrase,
    );
  }

  void _printError(http.BaseRequest request, Object error) {
    debugPrint('╭─────────────────────────────────────────────────────────────────');
    debugPrint('│ 🔴 ERROR: ${request.method} ${request.url}');
    debugPrint('│ ────────────────────────────────────────────────────────────────');
    debugPrint('│ Exception: $error');
    debugPrint('╰─────────────────────────────────────────────────────────────────');
  }

  void _printPrettyJson(String text) {
    try {
      final decoded = json.decode(text);
      final encoder = const JsonEncoder.withIndent('  ');
      final pretty = encoder.convert(decoded);
      for (final line in pretty.split('\n')) {
        debugPrint('│   $line');
      }
    } catch (e) {
      // Fallback if it's not JSON
      for (final line in text.split('\n')) {
        debugPrint('│   $line');
      }
    }
  }
}
