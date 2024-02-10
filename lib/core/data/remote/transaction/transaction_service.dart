import 'package:flutter_ex/core/app/app_response.dart';
import 'package:flutter_ex/core/data/remote/app/app_remote_service.dart';
import 'package:flutter_ex/core/data/remote/app/app_remote_url.dart';
import 'package:flutter_ex/core/data/remote/transaction/response/transaction_response.dart';
import 'package:flutter_ex/extension/double_extension.dart';

class TransactionService {
  final AppRemoteService _appRemoteService;

  TransactionService(this._appRemoteService);

  Future<AppResponse<List<TransactionResponse>>> listTransaction({
    required double? id,
    int page = 1
  }) async {
    final response = await _appRemoteService.getRequest(
      "${AppRemoteUrl.transactionWallet}/${id.orZero.truncate()}",
      {
        "page" : page,
        "size" : 15
      }.map((key, value) => MapEntry(key, value.toString()))
    );

    return response.when(
        success: (json) {
          final List<dynamic>? listJson = json;
          return AppResponse.success(
              data: listJson?.map((map) => TransactionResponse.fromJson(map)).toList()
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