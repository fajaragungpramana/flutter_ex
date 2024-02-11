import 'package:flutter_ex/core/app/app_response.dart';
import 'package:flutter_ex/core/data/remote/auth/request/register_request.dart';
import 'package:flutter_ex/core/domain/auth/auth_use_case.dart';
import 'package:flutter_ex/core/data/remote/auth/auth_repository.dart';
import 'package:flutter_ex/core/data/remote/auth/request/login_request.dart';
import 'package:flutter_ex/core/domain/auth/model/auth.dart';

class AuthInteractor implements AuthUseCase {
  final AuthRepository _authRepository;

  AuthInteractor(this._authRepository);

  @override
  Future<AppResponse<Auth>> login(LoginRequest loginRequest) async {
    final response = await _authRepository.login(loginRequest);
    return response.when(
        success: (data) {
          return AppResponse.success(
              data: Auth(isLogin: data?.accessToken != null)
          );
        },
        failure: (message) {
          return AppResponse.failure(message: message);
        },
        error: (e) {
          return AppResponse.error(exception: e);
        }
    );
  }

  @override
  bool get isLogin => _authRepository.isLogin;

  @override
  void clear() => _authRepository.clear();

  @override
  Future<AppResponse<Auth>> register(RegisterRequest registerRequest) async {
    final response = await _authRepository.register(registerRequest);
    return response.when(
      success: (data) {
        return AppResponse.success(data: Auth(isRegister: data));
      },
      failure: (message) {
        return AppResponse.failure(message: message);
      },
      error: (e) {
        return AppResponse.error(exception: e);
      }
    );
  }

}
