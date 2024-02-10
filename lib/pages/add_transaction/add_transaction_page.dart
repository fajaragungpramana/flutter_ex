import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ex/gen/assets.gen.dart';
import 'package:flutter_ex/pages/add_transaction/add_transaction_controller.dart';
import 'package:flutter_ex/resources/values/app_style.dart';
import 'package:flutter_ex/widgets/views/ex_button.dart';
import 'package:flutter_ex/widgets/views/ex_collapse_scaffold.dart';
import 'package:flutter_ex/widgets/views/ex_text_field.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddTransactionPage extends GetView<AddTransactionController> {
  const AddTransactionPage({super.key});

  @override
  Widget build(BuildContext context) => ExCollapseScaffold(
      backEnable: Get.currentRoute.isNotEmpty,
      collapseEnable: false,
      title: Text(
        AppLocalizations.of(context)!.addTransaction,
        style: AppStyle.textSemiBold(),
      ),
      footer: Obx(() => ExButton(
          enable: controller.isAddTransactionEnable,
          labelText: AppLocalizations.of(context)!.next,
          onPressed: () => { controller.setTransaction() }
      )),
      children: [

        const SizedBox(height: 16),

        ExTextField(
            controller: controller.nameController,
            labelText: AppLocalizations.of(context)!.name
        ),

        const SizedBox(height: 16),

        ExTextField(
            controller: controller.descriptionController,
            labelText: AppLocalizations.of(context)!.description
        ),

        const SizedBox(height: 16),

        Row(
          children: [

            Expanded(
                child: ExTextField(
                    controller: controller.amountController,
                    labelText: AppLocalizations.of(context)!.amount,
                    keyboardType: TextInputType.number,
                  inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                )
            ),

            const SizedBox(width: 16),

            Expanded(
                child: ExTextField(
                    controller: controller.categoryController,
                    labelText: AppLocalizations.of(context)!.category,
                    readOnly: true,
                    suffixIcon: Assets.lib.resources.drawables.icDropdownGreen.image(),
                    onTap: () => { controller.listCategory() }
                )
            )

          ]
        )

      ]
  );

}