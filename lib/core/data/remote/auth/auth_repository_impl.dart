import 'package:flutter_ex/core/app/app_response.dart';
import 'package:flutter_ex/core/data/local/constant/local_constant.dart';
import 'package:flutter_ex/core/data/local/hive_service.dart';
import 'package:flutter_ex/core/data/remote/auth/auth_repository.dart';
import 'package:flutter_ex/core/data/remote/auth/auth_service.dart';
import 'package:flutter_ex/core/data/remote/auth/request/login_request.dart';
import 'package:flutter_ex/core/data/remote/auth/request/register_request.dart';
import 'package:flutter_ex/core/data/remote/auth/response/login_response.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;
  final HiveService _hiveManager;

  AuthRepositoryImpl(this._authService, this._hiveManager);

  @override
  Future<AppResponse<LoginResponse>> login(LoginRequest loginRequest) async {
    var service = await _authService.login(loginRequest);
    service.when(
        success: (data) {
          if (data == null) return;

          _hiveManager.set(LocalConstant.accessToken, data.accessToken);
          _hiveManager.set(LocalConstant.refreshToken, data.refreshToken);
        },
        failure: (message) {},
        error: (e) {}
    );

    return service;
  }

  @override
  bool get isLogin => _hiveManager.get(LocalConstant.refreshToken) != null;

  @override
  void clear() => _hiveManager.clear();

  @override
  Future<AppResponse<bool>> register(RegisterRequest registerRequest) async =>
      _authService.register(registerRequest);

}
