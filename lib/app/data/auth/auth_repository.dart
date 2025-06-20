import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fskeleton/app/data/auth/model/login_response.dart';
import 'package:fskeleton/core.dart';

const _accessTokenKey = 'atk';

class AuthRepository {
  AuthRepository(this._httpClient, this._secureStorage);

  static final provider = Provider((ref) {
    return AuthRepository(
      ref.watch(HttpClient.wmsApiProvider),
      const FlutterSecureStorage(),
    );
  });

  final HttpClient _httpClient;

  final FlutterSecureStorage _secureStorage;

  final StreamController<String> _accessTokenStreamController =
      StreamController.broadcast();

  late Stream<bool> isLoggedInStream = _accessTokenStreamController.stream
      .map((event) => event.isEmpty)
      .where((event) => event);

  Future<LoginResourceResponse> login({
    required String email,
    required String password,
    bool rememberMe = true,
  }) async {
    try {
      final response = await _httpClient.post<Map<String, dynamic>>(
        path: '/api/login',
        body: {
          'email_or_username': email,
          'password': password,
        },
      );

      final data = LoginResponse.fromJson(response).data.resource;

      if (rememberMe) {
        _secureStorage.write(
          key: _accessTokenKey,
          value: data.first.toString(),
        );
      }

      return LoginResourceResponse.fromJson(data[1] as Map<String, dynamic>);
    } on HttpStatusCodeException catch (_) {
      rethrow;
    }
  }

  Future<bool> isLoggedIn() async {
    return ((await _secureStorage.read(key: _accessTokenKey)) ?? '').isNotEmpty;
  }

  void clearSession() {
    _secureStorage.delete(key: _accessTokenKey);
    _accessTokenStreamController.add('');
  }

  Future<String> getAccessToken() async {
    return (await _secureStorage.read(key: _accessTokenKey)) ?? '';
  }
}
