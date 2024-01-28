import 'package:flutter/material.dart';
import 'package:flutter_ex/pages/main/main_controller.dart';
import 'package:get/get.dart';

class MainPage extends GetView<MainController> {
  MainPage({Key? key}) : super(key: key);

  final _mainController = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body : const SafeArea(
        child: Stack(
          children: [

          ]
        )
      )
    );
  }

}