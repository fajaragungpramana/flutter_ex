import 'package:flutter_ex/core/data/remote/transaction/response/payment_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_response.freezed.dart';
part 'transaction_response.g.dart';

@freezed
class TransactionResponse with _$TransactionResponse {
  const factory TransactionResponse({
    String? name,
    String? description,
    String? type,
    String? category,
    PaymentResponse? payment,
    String? status,
    @JsonKey(name: "created_at") double? createdAt
  }) = _TransactionResponse;

  factory TransactionResponse.fromJson(Map<String, dynamic> json) => _$TransactionResponseFromJson(json);

}