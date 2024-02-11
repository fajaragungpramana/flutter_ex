import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_response.freezed.dart';

part 'category_response.g.dart';

@freezed
class CategoryResponse with _$CategoryResponse {
  const factory CategoryResponse({
    double? id,
    String? name
  }) = _CategoryResponse;

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);
}
