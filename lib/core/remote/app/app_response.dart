import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_response.freezed.dart';

@freezed
class AppResponse<T> with _$AppResponse<T> {

  const factory AppResponse.success({required T data}) = _AppResponseSuccess;

  const factory AppResponse.error({required String message}) = AppResponseError;

}