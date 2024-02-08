import 'package:flutter_ex/core/app/app_response.dart';
import 'package:flutter_ex/core/data/remote/app/app_remote_service.dart';
import 'package:flutter_ex/core/data/remote/app/app_remote_url.dart';
import 'package:flutter_ex/core/data/remote/type/response/type_response.dart';

class TypeService {
  final AppRemoteService _appRemoteService;

  const TypeService(this._appRemoteService);

  Future<AppResponse<List<TypeResponse>>> listType() async {
    var response = await _appRemoteService.getRequest(
        AppRemoteUrl.typeWallet, null
    );

    return response.when(
        success: (json) {
          final List<dynamic>? jsonList = json;
          return AppResponse.success(
              data: jsonList?.map((map) => TypeResponse.fromJson(map)).toList()
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