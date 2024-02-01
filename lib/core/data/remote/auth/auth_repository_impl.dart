import 'package:flutter_ex/core/app/app_response.dart';
import 'package:flutter_ex/core/data/local/hive_manager.dart';
import 'package:flutter_ex/core/data/remote/auth/auth_repository.dart';
import 'package:flutter_ex/core/data/remote/auth/auth_service.dart';
import 'package:flutter_ex/core/data/remote/auth/request/login_request.dart';
import 'package:flutter_ex/core/data/remote/auth/response/login_response.dart';
import 'package:flutter_ex/extension/string_extension.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;
  final HiveManager _hiveManager;

  AuthRepositoryImpl(this._authService, this._hiveManager);

  @override
  Future<AppResponse<LoginResponse>> login(LoginRequest loginRequest) async {
    var service = await _authService.login(loginRequest);
    service.when(
        success: (data) {
          if (data == null) return;

          _hiveManager.setAccessToken = data.accessToken.orEmpty;
          _hiveManager.setRefreshToken = data.refreshToken.orEmpty;
        },
        failure: (message) {},
        error: (e) {}
    );

    return service;
  }

  @override
  bool get isLogin => _hiveManager.accessToken != null;

}
