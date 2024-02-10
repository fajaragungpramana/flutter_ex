import 'package:flutter_ex/core/app/app_response.dart';
import 'package:flutter_ex/core/data/remote/app/app_remote_service.dart';
import 'package:flutter_ex/core/data/remote/app/app_remote_url.dart';
import 'package:flutter_ex/core/data/remote/category/response/category_response.dart';

class CategoryService {
  final AppRemoteService _appRemoteService;

  CategoryService(this._appRemoteService);

  Future<AppResponse<List<CategoryResponse>>> listCategory() async {
    final response = await _appRemoteService.getRequest(
      AppRemoteUrl.categoryList,
      null
    );

    return response.when(
        success: (json) {
          final List<dynamic>? listJson = json;
          return AppResponse.success(
              data: listJson?.map((map) => CategoryResponse.fromJson(map)).toList()
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