import 'package:flutter/material.dart';
import 'package:flutter_ex/pages/splash/splash_controller.dart';
import 'package:flutter_ex/resources/values/app_color.dart';
import 'package:flutter_ex/resources/values/app_style.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashPage extends GetView<SplashController> {
  SplashPage({Key? key}) : super(key: key);

  final _splashController = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Stack(
              children: [

                Align(
                    alignment: Alignment.center,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Obx(() => Text(
                              _splashController.appName,
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
                          )

                        ]
                    )
                ),

                Align(
                    alignment: Alignment.bottomCenter,
                    child: Obx(() => Text(
                        _splashController.appVersion,
                      style: AppStyle.textRegular(color: AppColor.black50),
                    ))
                )

              ]
          )
        )
      )
    );
  }

}