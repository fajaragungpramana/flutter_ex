import 'package:flutter/material.dart';
import 'package:flutter_ex/extension/double_extension.dart';
import 'package:flutter_ex/extension/string_extension.dart';
import 'package:flutter_ex/core/data/remote/user/response/wallet_response.dart';
import 'package:flutter_ex/gen/assets.gen.dart';
import 'package:flutter_ex/resources/values/app_color.dart';
import 'package:flutter_ex/resources/values/app_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WalletItem extends StatelessWidget {
  final WalletResponse walletResponse;

  const WalletItem({
    Key? key,
    required this.walletResponse
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Wrap(
      children: [

        Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: AppColor.green10,
                borderRadius: BorderRadius.circular(16)
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Assets.lib.resources.drawables.icCashGreen.image(),

                  const SizedBox(height: 8),

                  Row(
                      children: [

                        Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.green100
                            )
                        ),

                        const SizedBox(width: 8),

                        Text(
                          _mapType(context).orEmpty,
                          style: AppStyle.textRegular(color: AppColor.green100),
                        )

                      ]
                  ),

                  const SizedBox(height: 16),

                  Text(
                    AppLocalizations.of(context)!.name,
                    style: AppStyle.textRegular(color: AppColor.gray100),
                  ),

                  const SizedBox(height: 4),

                  Text(
                      walletResponse.name.orEmpty,
                      style: AppStyle.textRegular()
                  ),

                  const SizedBox(height: 16),

                  Text(
                    AppLocalizations.of(context)!.balance,
                    style: AppStyle.textRegular(color: AppColor.gray100),
                  ),

                  const SizedBox(height: 4),

                  Text(
                      walletResponse.balance.currencyFormat,
                      style: AppStyle.textSemiBold(fontSize: 14)
                  )

                ]
            )
        )

      ]
  );

  String _mapType(BuildContext context) {
    switch (walletResponse.type) {
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