import 'package:flutter_ex/core/app/app_response.dart';
import 'package:flutter_ex/core/data/remote/auth/request/login_request.dart';
import 'package:flutter_ex/core/data/remote/auth/request/register_request.dart';
import 'package:flutter_ex/core/domain/auth/model/auth.dart';

abstract class AuthUseCase {

  Future<AppResponse<Auth>> login(LoginRequest loginRequest);

  Future<Auth> get auth;

  Future<void> clear();

  Future<AppResponse<Auth>> register(RegisterRequest registerRequest);

}