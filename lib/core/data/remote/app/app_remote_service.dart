import 'package:flutter_ex/core/app/app_response.dart';
import 'package:flutter_ex/core/data/local/hive_manager.dart';
import 'package:flutter_ex/core/data/remote/app/app_remote_url.dart';
import 'package:get/get_connect/connect.dart';

class AppRemoteService extends GetConnect {
  final HiveManager _hiveManager;

  AppRemoteService(this._hiveManager) {
    httpClient.baseUrl = AppRemoteUrl.baseUrl;
    httpClient.timeout = const Duration(seconds: 10);

    httpClient.addAuthenticator<Object?>((request) {
      if (_hiveManager.accessToken != null) {
        request.headers["Authorization"] = "Bearer ${_hiveManager.accessToken}";
      }

      return request;
    });
  }

  Future<AppResponse<dynamic>> postRequest(String url, dynamic body) async {
    try {
      var response = await post(
          url,
          body,
          contentType: 'application/json'
      );

      if (response.isOk) {
        var data = response.body['data'];
        return AppResponse.success(data: data);
      } else {
        var message = response.body['message'];
        return AppResponse.failure(message: message);
      }
    } catch (e) {
      return AppResponse.error(exception: e);
    }
  }

}