import 'package:flutter/material.dart';
import 'package:flutter_ex/extension/string_extension.dart';
import 'package:flutter_ex/gen/assets.gen.dart';
import 'package:flutter_ex/pages/home/home_controller.dart';
import 'package:flutter_ex/resources/values/app_color.dart';
import 'package:flutter_ex/resources/values/app_style.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.gray10,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Obx(() => Text(
              controller.userResponse.fullName.orEmpty,
              style: AppStyle.textSemiBold(fontSize: 20)
            )),

            Obx(() => Text(
              controller.userResponse.email.orEmpty,
              style: AppStyle.textRegular(
                  color: AppColor.black50,
                  fontSize: 14
              )
            ))

          ]
        ),
        actions: [

          Padding(
              padding: const EdgeInsets.only(right: 16),
              child: GestureDetector(
                  onTap: () { },
                  child: Assets.lib.resources.drawables.icNotification.image()
              )
          )

        ]
      ),
      body: Container(
        color: AppColor.gray10,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
            children: [

              const SizedBox(height: 16),

              Row(
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                          AppLocalizations.of(context)!.totalBalance,
                          style: AppStyle.textRegular(color: AppColor.black50)
                      ),

                      const SizedBox(height: 2),

                      Text(
                        AppLocalizations.of(context)!.rp0,
                        style: AppStyle.textSemiBold(fontSize: 20),
                      )

                    ]
                  ),

                  const Spacer(),

                  Obx(() => Visibility(
                      visible: controller.listWalletResponse.isNotEmpty,
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            AppLocalizations.of(context)!.addWallet,
                            style: AppStyle.textSemiBold(color: AppColor.green100, fontSize: 14),
                          )
                      )
                  ))

                ]
              )

            ]
        )
      )
    );
  }
}