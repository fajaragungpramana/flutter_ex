import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_request.freezed.dart';
part 'transaction_request.g.dart';

@freezed
class TransactionRequest with _$TransactionRequest {
  const factory TransactionRequest({
    String? name,
    String? description,
    @JsonKey(name: "wallet_id") double? walletId,
    double? amount,
    @JsonKey(name: "category_id") double? categoryId
  }) = _TransactionRequest;

  factory TransactionRequest.fromJson(Map<String, dynamic> json) => _$TransactionRequestFromJson(json);
}