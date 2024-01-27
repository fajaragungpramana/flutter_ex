import 'package:flutter/material.dart';
import 'package:flutter_ex/ui/splash/splash_controller.dart';
import 'package:get/get.dart';

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

                          Obx(() => Text(_splashController.appName)),

                          Text("Manage Your Expense")

                        ]
                    )
                ),

                Align(
                    alignment: Alignment.bottomCenter,
                    child: Obx(() => Text(_splashController.appVersion) )
                )

              ]
          )
        )
      )
    );
  }

}