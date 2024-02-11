import 'package:flutter/material.dart';
import 'package:flutter_ex/core/data/remote/category/response/category_response.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Category {
  final double? id;
  final String? name;

  Category({
    this.id,
    this.name
  });

  static List<Category> mapToList(List<CategoryResponse>? listCategoryResponse) {
    final list = <Category>[];
    listCategoryResponse?.forEach((categoryResponse) {
      list.add(Category(
        id: categoryResponse.id,
        name: _mapName(categoryResponse.name)
      ));
    });

    return list;
  }

  static String _mapName(String? name) {
    final localization = AppLocalizations.of(Get.context as BuildContext)!;

    switch (name) {
      case "HOUSE":
        return localization.house;
      case "TRANSPORTATION":
        return localization.transportation;
      case "FOOD":
        return localization.food;
      case "DRINK":
        return localization.drink;
      case "UTILITY":
        return localization.utility;
      case "INSURANCE":
        return localization.insurance;
      case "MEDICAL_AND_HEALTH_CARE":
        return localization.medicalAndHealthCare;
      case "SAVING_AND_INVESTING":
        return localization.savingAndInvesting;
      case "DEPT":
        return localization.dept;
      case "PERSONAL_SPENDING":
        return localization.personalSpending;
      case "RECREATION_AND_ENTERTAINMENT":
        return localization.recreationAndEntertainment;
      case "MISCELLANEOUS":
        return localization.miscellaneous;
      case "TOP_UP":
        return localization.topUp;

      default:
        return "";
    }
  }
}