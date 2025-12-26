import 'package:flutter/foundation.dart';
import 'package:mini_chat_app/src/src.dart';

@immutable
sealed class AppStatus {
  const AppStatus();

  /// No work started yet.
  const factory AppStatus.initial() = _Initial;

  /// Work in progress (e.g., in-flight request).
  const factory AppStatus.loading() = _Loading;

  /// Operation completed successfully (data lives in your own fields).
  const factory AppStatus.success() = _Success;

  /// Operation completed but there is no data to show.
  const factory AppStatus.empty() = _Empty;

  /// Operation failed with an [AppFailure].
  const factory AppStatus.failure(AppFailure failure) = _Failure;

  // -------- Convenience guards --------

  bool get isInitial => this is _Initial;
  bool get isLoading => this is _Loading;
  bool get isSuccess => this is _Success;
  bool get isEmpty => this is _Empty;
  bool get isFailure => this is _Failure;

  /// Extract the underlying [AppFailure]
  /// when this is `failure`, otherwise null.
  AppFailure? get error => this is _Failure ? (this as _Failure).failure : null;
}

/// See [AppStatus.initial]
class _Initial extends AppStatus {
  const _Initial();

  @override
  String toString() => 'AppStatus.initial';
}

/// See [AppStatus.loading]
class _Loading extends AppStatus {
  const _Loading();

  @override
  String toString() => 'AppStatus.loading';
}

/// See [AppStatus.success]
class _Success extends AppStatus {
  const _Success();

  @override
  String toString() => 'AppStatus.success';
}

/// See [AppStatus.empty]
class _Empty extends AppStatus {
  const _Empty();

  @override
  String toString() => 'AppStatus.empty';
}

/// See [AppStatus.failure]
class _Failure extends AppStatus {
  const _Failure(this.failure);

  /// The normalized failure for this operation.
  final AppFailure failure;

  @override
  String toString() => 'AppStatus.failure -> $failure';
}
