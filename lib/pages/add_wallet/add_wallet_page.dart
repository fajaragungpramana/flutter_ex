import 'package:flutter/material.dart';
import 'package:flutter_ex/gen/assets.gen.dart';
import 'package:flutter_ex/pages/add_wallet/add_wallet_controller.dart';
import 'package:flutter_ex/resources/values/app_style.dart';
import 'package:flutter_ex/widgets/views/ex_button.dart';
import 'package:flutter_ex/widgets/views/ex_text_field.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddWalletPage extends GetView<AddWalletController> {
  const AddWalletPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text(
        AppLocalizations.of(context)!.addWallet,
        style: AppStyle.textSemiBold()
      )
    ),
    body: Container(
      padding: const EdgeInsets.all(16),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            ExTextField(
                controller: controller.nameController,
                labelText: AppLocalizations.of(context)!.name
            ),

            const SizedBox(height: 16),

            GestureDetector(
              onTap: () => { controller.listType() },
              child: ExTextField(
                  controller: controller.typeController,
                  labelText: AppLocalizations.of(context)!.type,
                  enabled: false,
                  suffixIcon: Assets.lib.resources.drawables.icDropdownGreen.image()
              )
            ),

            const Spacer(),

            ExButton(
                labelText: AppLocalizations.of(context)!.next,
                onPressed: () => {}
            )

          ]
      )
    )
  );

}