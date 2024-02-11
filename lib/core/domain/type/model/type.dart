import 'package:flutter/material.dart';
import 'package:flutter_ex/core/data/remote/type/response/type_response.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

class Type {
  final double? id;
  final String? name;

  Type({
    this.id,
    this.name
  });

  static List<Type> mapToList(List<TypeResponse>? listTypeResponse) {
    final list = <Type>[];

    listTypeResponse?.forEach((typeResponse) {
      list.add(Type(
        id: typeResponse.id,
        name: _mapName(typeResponse.name)
      ));
    });

    return list;
  }

  static String _mapName(String? type) {
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