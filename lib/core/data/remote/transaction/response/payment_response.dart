import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_response.freezed.dart';
part 'payment_response.g.dart';

@freezed
class PaymentResponse with _$PaymentResponse {
  const factory PaymentResponse({
    double? amount,
    String? status,
    String? type,
    @JsonKey(name: "created_at") double? createdAt
  }) = _PaymentResponse;

  factory PaymentResponse.fromJson(Map<String, dynamic> json) => _$PaymentResponseFromJson(json);

}