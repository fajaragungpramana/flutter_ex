import 'package:flutter_ex/core/app/app_response.dart';
import 'package:flutter_ex/core/data/remote/auth/request/login_request.dart';
import 'package:flutter_ex/core/data/remote/auth/request/register_request.dart';
import 'package:flutter_ex/core/data/remote/auth/response/login_response.dart';

abstract class AuthRepository {

  Future<AppResponse<LoginResponse>> login(LoginRequest loginRequest);

  bool get isLogin;

  void clear();

  Future<AppResponse<bool>> register(RegisterRequest registerRequest);

}