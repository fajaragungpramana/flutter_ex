import 'package:flutter/material.dart';
import 'package:flutter_ex/resources/values/app_color.dart';
import 'package:flutter_ex/resources/values/app_style.dart';
import 'package:flutter_ex/widgets/views/ex_bottom_sheet.dart';
import 'package:flutter_ex/widgets/views/ex_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

class LogoutBottomSheet extends StatelessWidget {
  final Function() onLogoutPressed;

  const LogoutBottomSheet({
    Key? key,
    required this.onLogoutPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ExBottomSheet(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              AppLocalizations.of(context)!.areYouSureToSignOut,
              style: AppStyle.textSemiBold(),
            ),

            const SizedBox(height: 8),

            Text(
                AppLocalizations.of(context)!.areYouSureToSignOutMessage,
                style: AppStyle.textRegular(color: AppColor.black50)
            ),

            const SizedBox(height: 24),

            Row(
                children: [

                  Expanded(
                      child: ExButton(
                          labelText: AppLocalizations.of(context)!.signOut,
                          onPressed: () => { onLogoutPressed() })
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                      child: ExButton(
                          labelText: AppLocalizations.of(context)!.cancel,
                          labelColor: AppColor.green100,
                          backgroundColor: AppColor.green50,
                          onPressed: () { Get.back(); })
                  )

                ]
            )

          ]
      )
  );

}