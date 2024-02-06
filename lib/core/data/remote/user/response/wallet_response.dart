import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_response.freezed.dart';
part 'wallet_response.g.dart';

@freezed
class WalletResponse with _$WalletResponse {
  const factory WalletResponse({
    String? name,
    String? type,
    double? balance
  }) = _WalletResponse;

  factory WalletResponse.fromJson(Map<String, dynamic> json) => _$WalletResponseFromJson(json);

  static List<WalletResponse> skeleton() {
    final List<WalletResponse> listDummy = [];

    for (int i = 0; i < 3; i++) {
      listDummy.add(const WalletResponse(
        name: "********",
        type: "*****",
        balance: 0
      ));
    }

    return listDummy;
  }
}