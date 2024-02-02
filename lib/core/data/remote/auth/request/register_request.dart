import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_request.freezed.dart';
part 'register_request.g.dart';

@freezed
class RegisterRequest with _$RegisterRequest {
  const factory RegisterRequest({
    @JsonKey(name: "full_name") required String? fullName,
    required String? email,
    required String? password
  }) = _RegisterRequest;

  factory RegisterRequest.fromJson(Map<String, dynamic> json) => _$RegisterRequestFromJson(json);
}