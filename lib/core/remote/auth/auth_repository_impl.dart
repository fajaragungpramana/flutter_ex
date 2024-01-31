import 'package:flutter_ex/core/remote/auth/auth_repository.dart';
import 'package:flutter_ex/core/remote/auth/auth_service.dart';
import 'package:flutter_ex/core/remote/auth/request/login_request.dart';
import 'package:flutter_ex/core/remote/auth/response/login_response.dart';

import '../app/app_response.dart';

class AuthRepositoryImpl implements AuthRepository {

  final AuthService _authService;

  AuthRepositoryImpl(this._authService);

  @override
  Future<AppResponse<LoginResponse>> login(LoginRequest loginRequest) => _authService.login(loginRequest);

}