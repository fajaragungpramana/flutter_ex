import 'package:flutter/material.dart';
import 'package:flutter_ex/gen/assets.gen.dart';
import 'package:flutter_ex/pages/add_wallet/add_wallet_controller.dart';
import 'package:flutter_ex/resources/values/app_style.dart';
import 'package:flutter_ex/widgets/views/ex_button.dart';
import 'package:flutter_ex/widgets/views/ex_collapse_scaffold.dart';
import 'package:flutter_ex/widgets/views/ex_text_field.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddWalletPage extends GetView<AddWalletController> {
  const AddWalletPage({super.key});

  @override
  Widget build(BuildContext context) => ExCollapseScaffold(
      backEnable: Get.previousRoute.isNotEmpty,
      collapseEnable: false,
      title: Text(
          AppLocalizations.of(context)!.addWallet,
          style: AppStyle.textSemiBold()
      ),
      footer: Obx(() => ExButton(
          enable: controller.isAddWalletEnable,
          labelText: AppLocalizations.of(context)!.next,
          onPressed: () => { controller.setWallet() }
      )),
      children: [

        const SizedBox(height: 16),

        ExTextField(
            controller: controller.nameController,
            labelText: AppLocalizations.of(context)!.name
        ),

        const SizedBox(height: 16),

        ExTextField(
            controller: controller.typeController,
            labelText: AppLocalizations.of(context)!.type,
            readOnly: true,
            suffixIcon: Assets.lib.resources.drawables.icDropdownGreen.image(),
            onTap: () => { controller.listType() }
        )

      ]
  );

}