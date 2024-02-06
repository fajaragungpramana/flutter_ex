import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_response.freezed.dart';
part 'user_response.g.dart';

@freezed
class UserResponse with _$UserResponse {
  const factory UserResponse({
    @JsonKey(name: "full_name") String? fullName,
    @JsonKey(name: "email") String? email
  }) = _UserResponse;

  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);

  static UserResponse skeleton() => const UserResponse(
    fullName: "**************",
    email: "****************************"
  );
}