part of 'client.dart';

class AuthorizationInterceptor extends Interceptor {
  AuthorizationInterceptor(this.ref);

  final Ref ref;

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.type == DioExceptionType.connectionError ||
        err.type == DioExceptionType.unknown && err.error is SocketException) {
      $showMessage("No Internet Connection", isError: true);
    }
    handler.reject(err);
  }
}

/// Token refresh manager to handle 401 errors and prevent multiple refresh calls
/// Uses separate instances for different API endpoints
class TokenRefreshManager {
  // Separate managers for different market endpoints
  static final TokenRefreshManager marketData = TokenRefreshManager._internal();
  static final TokenRefreshManager marketDataNew =
      TokenRefreshManager._internal();

  TokenRefreshManager._internal();

  bool _isRefreshing = false;
  final List<_QueuedRequest> _pendingRequests = [];

  bool get isRefreshing => _isRefreshing;

  Future<Response<dynamic>?> handleRefresh({
    required Dio dio,
    required DioException error,
    required Ref ref,
    required Future<bool> Function() refreshTokenCallback,
    required String Function() getNewToken,
  }) async {
    debugPrint('🔄 Token refresh requested for: ${error.requestOptions.path}');

    if (_isRefreshing) {
      debugPrint('⏳ Token refresh already in progress, queuing request...');
      // Queue this request and wait for refresh to complete
      final completer = Completer<Response<dynamic>?>();
      _pendingRequests.add(
        _QueuedRequest(
          options: error.requestOptions,
          completer: completer,
          dio: dio,
          getNewToken: getNewToken,
        ),
      );
      return completer.future;
    }

    _isRefreshing = true;
    try {
      debugPrint('🔐 Starting token refresh...');
      final success = await refreshTokenCallback();

      if (success) {
        // Small delay to ensure SharedPreferences has propagated
        await Future.delayed(const Duration(milliseconds: 100));

        final newToken = getNewToken();
        debugPrint(
          '✅ Token refresh successful, new token: ${newToken.substring(0, math.min(20, newToken.length))}...',
        );

        // Retry the original request with new token
        final response = await _retryRequest(
          dio,
          error.requestOptions,
          newToken,
        );

        // Process all queued requests
        _processQueuedRequests();

        return response;
      } else {
        debugPrint('❌ Token refresh failed - callback returned false');
        // Clear user session on refresh failure
        _clearSessionAndLogout(ref);
        _failQueuedRequests(error);
        return null;
      }
    } catch (e, stackTrace) {
      debugPrint('❌ Token refresh exception: $e');
      debugPrint('Stack trace: $stackTrace');
      _clearSessionAndLogout(ref);
      _failQueuedRequests(error);
      return null;
    } finally {
      _isRefreshing = false;
    }
  }

  Future<Response<dynamic>> _retryRequest(
    Dio dio,
    RequestOptions requestOptions,
    String newToken,
  ) async {
    debugPrint(
      '🔁 Retrying request: ${requestOptions.method} ${requestOptions.path}',
    );

    // Update the authorization header with new token
    final headers = Map<String, dynamic>.from(requestOptions.headers);
    headers[HttpHeaders.authorizationHeader] = 'Bearer $newToken';

    final options = Options(method: requestOptions.method, headers: headers);

    try {
      final response = await dio.request(
        requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options,
      );
      debugPrint('✅ Retry successful: ${response.statusCode}');
      return response;
    } catch (e) {
      debugPrint('❌ Retry failed: $e');
      rethrow;
    }
  }

  void _processQueuedRequests() {
    for (final request in _pendingRequests) {
      final newToken = request.getNewToken();
      _retryRequest(request.dio, request.options, newToken)
          .then((response) {
            request.completer.complete(response);
          })
          .catchError((error) {
            request.completer.completeError(error);
          });
    }
    _pendingRequests.clear();
  }

  void _failQueuedRequests(DioException originalError) {
    for (final request in _pendingRequests) {
      request.completer.completeError(originalError);
    }
    _pendingRequests.clear();
  }

  void _clearSessionAndLogout(Ref ref) {
    String password = ref.read(localDataProvider).getPassword1 ?? "";
    String email = ref.read(localDataProvider).getEmail ?? "";
    String rememberMe = ref.read(localDataProvider).getRemamberMe ?? "";
    ref.read(localDataProvider).clearAllData();
    ref.read(localDataProvider).setEmail(email);
    ref.read(localDataProvider).setPassword(password);
    ref.read(localDataProvider).setRememberMe(rememberMe);
  }
}

class _QueuedRequest {
  final RequestOptions options;
  final Completer<Response<dynamic>?> completer;
  final Dio dio;
  final String Function() getNewToken;

  _QueuedRequest({
    required this.options,
    required this.completer,
    required this.dio,
    required this.getNewToken,
  });
}

class AuthorizationInterceptorMarket extends Interceptor {
  AuthorizationInterceptorMarket(this.ref);

  final Ref ref;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // final token = ref.read(accessTokenProvider);

    // if (token != null) {

    //   options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    // }

    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final response = err.response;
    if (err.type == DioExceptionType.connectionError ||
        err.type == DioExceptionType.unknown && err.error is SocketException) {
      $showMessage("No Internet Connection", isError: true);
    } else if (response?.statusCode == 401) {
      final newToken = ref.read(localDataProvider).refreshToken;
      if (newToken != null) {
        ref.read(localDataProvider).setAccessToken(newToken);
      }

      handler.reject(err);
    }
  }
}

class AuthorizationInterceptorMarketNew extends Interceptor {
  AuthorizationInterceptorMarketNew(this.ref);

  final Ref ref;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // final token = ref.read(accessTokenProvider);

    // if (token != null) {

    //   options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    // }

    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final response = err.response;
    if (err.type == DioExceptionType.connectionError ||
        err.type == DioExceptionType.unknown && err.error is SocketException) {
      $showMessage("No Internet Connection", isError: true);
    } else if (response?.statusCode == 401) {
      final newToken = ref.read(localDataProvider).refreshToken;
      if (newToken != null) {
        ref.read(localDataProvider).setAccessToken(newToken);
      }

      handler.reject(err);
    }
  }
}
