import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'category_response.freezed.dart';

part 'category_response.g.dart';

@freezed
class CategoryResponse with _$CategoryResponse {
  const factory CategoryResponse({
    double? id,
    String? name
  }) = _CategoryResponse;

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);

  static String mapName(BuildContext context, String? name) {
    switch (name) {
      case "HOUSE":
        return AppLocalizations.of(context)!.house;
      case "TRANSPORTATION":
        return AppLocalizations.of(context)!.transportation;
      case "FOOD":
        return AppLocalizations.of(context)!.food;
      case "DRINK":
        return AppLocalizations.of(context)!.drink;
      case "UTILITY":
        return AppLocalizations.of(context)!.utility;
      case "INSURANCE":
        return AppLocalizations.of(context)!.insurance;
      case "MEDICAL_AND_HEALTH_CARE":
        return AppLocalizations.of(context)!.medicalAndHealthCare;
      case "SAVING_AND_INVESTING":
        return AppLocalizations.of(context)!.savingAndInvesting;
      case "DEPT":
        return AppLocalizations.of(context)!.dept;
      case "PERSONAL_SPENDING":
        return AppLocalizations.of(context)!.personalSpending;
      case "RECREATION_AND_ENTERTAINMENT":
        return AppLocalizations.of(context)!.recreationAndEntertainment;
      case "MISCELLANEOUS":
        return AppLocalizations.of(context)!.miscellaneous;
      case "TOP_UP":
        return AppLocalizations.of(context)!.topUp;

      default:
        return "";
    }
  }
}
