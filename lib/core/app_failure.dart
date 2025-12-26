import 'package:flutter/foundation.dart';

@immutable
class AppFailure implements Exception {
  const AppFailure({
    required this.message,
    this.code,
    this.status,
    this.cause,
    this.stackTrace,
    this.extra,
  });

  factory AppFailure.http({
    required String message,
    required int status,
    String? code,
    Object? cause,
    StackTrace? stack,
    Map<String, Object?>? extra,
  }) => AppFailure(
    message: message,
    status: status,
    code: code ?? 'http',
    cause: cause,
    stackTrace: stack,
    extra: extra,
  );

  /// Validation error (either client-side or 422 from backend—your choice).
  factory AppFailure.validation(
    String message, {
    Object? cause,
    StackTrace? stack,
  }) => AppFailure(
    message: message,
    code: 'validation',
    cause: cause,
    stackTrace: stack,
  );

  /// Timeout error (send/receive/connection timeout).
  factory AppFailure.timeout({
    String? message,
    Object? cause,
    StackTrace? stack,
  }) => AppFailure(
    message: message ?? 'Request timed out. Please try again.',
    code: 'timeout',
    cause: cause,
    stackTrace: stack,
  );

  /// Network/connection error (offline/DNS/socket).
  factory AppFailure.network({
    String? message,
    Object? cause,
    StackTrace? stack,
  }) => AppFailure(
    message: message ?? 'Network error. Please check your connection.',
    code: 'network',
    cause: cause,
    stackTrace: stack,
  );

  /// Catch-all for unexpected errors that escaped earlier layers.
  factory AppFailure.unexpected(Object e, StackTrace st, {String? message}) =>
      AppFailure(
        message: message ?? 'Unexpected error: $e',
        code: 'unexpected',
        cause: e,
        stackTrace: st,
      );

  /// Human-readable message suitable for UI.
  final String message;

  /// Machine-readable category:
  /// 'network', 'timeout', 'auth', 'validation', 'http', 'unexpected', etc.
  final String? code;

  /// HTTP status code when available (generally non-2xx like 401/404/500).
  final int? status;

  /// The original low-level error (e.g., DioException) for diagnostics.
  final Object? cause;

  /// Where the error originated; keep this for crash reporting.
  final StackTrace? stackTrace;

  /// Arbitrary structured context (endpoint, method, payload hints, etc.).
  final Map<String, Object?>? extra;

  @override
  String toString() {
    final codePart = code != null ? '$code' : 'unknown';
    final statusPart = status != null ? '/$status' : '';
    return 'AppFailure($codePart$statusPart): $message';
  }
}

/// Convenience predicates for common branching in UI/logic.
extension AppFailureX on AppFailure {
  bool get isAuth => code == 'auth' || status == 401;
  bool get isNetwork => code == 'network';
  bool get isTimeout => code == 'timeout';
  bool get isValidation => code == 'validation';
}
