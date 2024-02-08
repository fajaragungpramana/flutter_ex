import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_request.freezed.dart';
part 'wallet_request.g.dart';

@freezed
class WalletRequest with _$WalletRequest {
  const factory WalletRequest({
    required String? name,
    @JsonKey(name: "type_id") required double? typeId
  }) = _WalletRequest;

  factory WalletRequest.fromJson(Map<String, dynamic> json) => _$WalletRequestFromJson(json);
}