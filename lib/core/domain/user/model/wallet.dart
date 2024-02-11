import 'package:flutter/material.dart';
import 'package:flutter_ex/core/data/remote/user/response/wallet_response.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Wallet {
  final double? id;
  final String? name;
  final String? type;
  final double? balance;

  Wallet({
    this.id,
    this.name,
    this.type,
    this.balance
  });

  static Wallet skeleton() => Wallet(
      name: "***********",
      balance: 0
  );

  static List<Wallet> listSkeleton() {
    final List<Wallet> listDummy = [];

    for (int i = 0; i < 3; i++) {
      listDummy.add(Wallet(
          name: "********",
          type: "*****",
          balance: 0
      ));
    }

    return listDummy;
  }

  static mapToObject(WalletResponse? walletResponse) => Wallet(
    id: walletResponse?.id,
    name: walletResponse?.name,
    type: _mapType(walletResponse?.type),
    balance: walletResponse?.balance
  );

  static List<Wallet> mapToList(List<WalletResponse>? listWalletResponse) {
    final list = <Wallet>[];
    listWalletResponse?.forEach((walletResponse) {
      list.add(Wallet(
        id: walletResponse.id,
        name: walletResponse.name,
        type: _mapType(walletResponse.type),
        balance: walletResponse.balance
      ));
    });

    return list;
  }

  static String _mapType(String? type) {
    final localization = AppLocalizations.of(Get.context as BuildContext)!;

    switch (type) {
      case "CASH":
        return localization.cash;
      case "BANK_ACCOUNT":
        return localization.bankAccount;
      case "E_WALLET":
        return localization.eWallet;
      case "E_MONEY":
        return localization.eMoney;

      default:
        return "";
    }
  }

}