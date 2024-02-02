import 'package:flutter_ex/core/app/app_response.dart';
import 'package:flutter_ex/core/data/remote/app/app_remote_service.dart';
import 'package:flutter_ex/core/data/remote/app/app_remote_url.dart';
import 'package:flutter_ex/core/data/remote/auth/request/login_request.dart';
import 'package:flutter_ex/core/data/remote/auth/response/login_response.dart';

class AuthService {
  final AppRemoteService _appRemoteService;

  AuthService(this._appRemoteService);

  Future<AppResponse<LoginResponse>> login(LoginRequest loginRequest) async {
    var response = await _appRemoteService.postRequest(
        AppRemoteUrl.login, loginRequest.toJson()
    );
    return response.when(
        success: (json) {
          var data = LoginResponse.fromJson(json);
          return AppResponse.success(data: data);
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