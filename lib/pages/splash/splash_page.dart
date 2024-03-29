import 'package:flutter/material.dart';
import 'package:flutter_ex/pages/splash/splash_controller.dart';
import 'package:flutter_ex/resources/values/app_color.dart';
import 'package:flutter_ex/resources/values/app_style.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(
              children: [

                const Spacer(),

                Obx(() => Text(
                    controller.appName,
                    style: AppStyle.textSemiBold(
                        fontSize: 40,
                        color: AppColor.green100
                    )
                )),

                Text(
                    AppLocalizations.of(context)!.manageYourExpense,
                    style: AppStyle.textRegular(
                        color: AppColor.black50
                    )
                ),

                const Spacer(),

                Obx(() => Text(
                  AppLocalizations.of(context)!.version(controller.appVersion),
                  style: AppStyle.textRegular(color: AppColor.black50),
                ))

              ]
          )
        )
      )
    );
  }

}