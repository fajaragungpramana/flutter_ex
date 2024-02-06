import 'package:flutter_ex/core/app/app_response.dart';
import 'package:flutter_ex/core/data/remote/app/app_remote_service.dart';
import 'package:flutter_ex/core/data/remote/app/app_remote_url.dart';
import 'package:flutter_ex/core/data/remote/user/response/user_response.dart';
import 'package:flutter_ex/core/data/remote/user/response/wallet_response.dart';

class UserService {
  final AppRemoteService _appRemoteService;

  UserService(this._appRemoteService);

  Future<AppResponse<UserResponse>> me() async {
    var response = await _appRemoteService.getRequest(
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
    var response = await _appRemoteService.getRequest(
        AppRemoteUrl.wallet,
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

}