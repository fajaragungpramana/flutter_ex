import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_response.freezed.dart';
part 'wallet_response.g.dart';

@freezed
class WalletResponse with _$WalletResponse {
  const factory WalletResponse({
    double? id,
    String? name,
    String? type,
    double? balance
  }) = _WalletResponse;

  factory WalletResponse.fromJson(Map<String, dynamic> json) => _$WalletResponseFromJson(json);
}