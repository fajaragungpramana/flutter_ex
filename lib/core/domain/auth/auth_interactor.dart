import 'package:flutter_ex/core/app/app_response.dart';
import 'package:flutter_ex/core/data/remote/auth/request/register_request.dart';
import 'package:flutter_ex/core/domain/auth/auth_use_case.dart';
import 'package:flutter_ex/core/data/remote/auth/auth_repository.dart';
import 'package:flutter_ex/core/data/remote/auth/request/login_request.dart';
import 'package:flutter_ex/core/data/remote/auth/response/login_response.dart';

class AuthInteractor implements AuthUseCase {
  final AuthRepository _authRepository;

  AuthInteractor(this._authRepository);

  @override // TODO: Mapping response with domain response
  Future<AppResponse<LoginResponse>> login(LoginRequest loginRequest) async =>
      _authRepository.login(loginRequest);

  @override
  bool get isLogin => _authRepository.isLogin;

  @override
  void clear() => _authRepository.clear();

  @override // TODO: Mapping response with domain response
  Future<AppResponse<bool>> register(RegisterRequest registerRequest) async =>
      _authRepository.register(registerRequest);

}
