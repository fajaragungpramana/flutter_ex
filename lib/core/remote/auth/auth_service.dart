import 'package:flutter_ex/core/remote/app/app_remote_service.dart';
import 'package:flutter_ex/core/remote/auth/request/login_request.dart';
import 'package:flutter_ex/core/remote/auth/response/login_response.dart';

import '../app/app_response.dart';

class AuthService extends AppRemoteService {

  Future<AppResponse<LoginResponse>> login(LoginRequest loginRequest) async {
    var response = await post("v1/authentication/login", loginRequest.toJson());

    if (response.isOk) {
      final loginResponse = LoginResponse.fromJson(response.body['data']);
      return AppResponse.success(data: loginResponse);
    } else {
      return AppResponse.error(message: response.body['message']);
    }
  }

}