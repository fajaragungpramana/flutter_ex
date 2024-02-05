import 'package:flutter_ex/pages/home/home_controller.dart';
import 'package:flutter_ex/pages/main/main_controller.dart';
import 'package:flutter_ex/pages/profile/profile_controller.dart';
import 'package:flutter_ex/pages/statistic/statistic_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => MainController());
    Get.lazyPut(() => HomeController(Get.find()));
    Get.lazyPut(() => StatisticController());
    Get.lazyPut(() => ProfileController(Get.find(), Get.find()));
  }

}