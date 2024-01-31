import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_response.freezed.dart';

@freezed
class AppResponse<T> with _$AppResponse<T> {
  const factory AppResponse.success({required T? data}) = _AppResponseSuccess;
  const factory AppResponse.failure({required String? message}) = _AppResponseFailure;
  const factory AppResponse.error({required Object? exception}) = _AppResponseError;
}
