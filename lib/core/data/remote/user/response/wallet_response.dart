import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  static WalletResponse skeleton() => const WalletResponse(
    name: "***********",
    balance: 0
  );

  static List<WalletResponse> listSkeleton() {
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

  static String mapType(BuildContext context, String type) {
    switch (type) {
      case "CASH":
        return AppLocalizations.of(context)!.cash;
      case "BANK_ACCOUNT":
        return AppLocalizations.of(context)!.bankAccount;
      case "E_WALLET":
        return AppLocalizations.of(context)!.eWallet;
      case "E_MONEY":
        return AppLocalizations.of(context)!.eMoney;

      default:
        return "";
    }
  }
}