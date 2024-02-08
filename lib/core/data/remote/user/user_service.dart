import 'package:flutter_ex/core/app/app_response.dart';
import 'package:flutter_ex/core/data/remote/app/app_remote_service.dart';
import 'package:flutter_ex/core/data/remote/app/app_remote_url.dart';
import 'package:flutter_ex/core/data/remote/user/request/wallet_request.dart';
import 'package:flutter_ex/core/data/remote/user/response/user_response.dart';
import 'package:flutter_ex/core/data/remote/user/response/wallet_response.dart';

class UserService {
  final AppRemoteService _appRemoteService;

  UserService(this._appRemoteService);

  Future<AppResponse<UserResponse>> me() async {
    final response = await _appRemoteService.getRequest(
        AppRemoteUrl.me,
        null
    );
    return response.when(
        success: (json) {
          var data = UserResponse.fromJson(json);
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

  Future<AppResponse<List<WalletResponse>>> listWallet() async {
    final response = await _appRemoteService.getRequest(
        AppRemoteUrl.userWallet,
        null
    );
    return response.when(
        success: (json) {
          final List<dynamic>? jsonList = json;
          return AppResponse.success(
              data: jsonList?.map((map) => WalletResponse.fromJson(map)).toList()
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

  Future<AppResponse<WalletResponse>> setWallet(WalletRequest walletRequest) async {
    final response = await _appRemoteService.postRequest(
      AppRemoteUrl.userWallet,
      walletRequest.toJson()
    );

    return response.when(
        success: (json) {
          return AppResponse.success(data: json);
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