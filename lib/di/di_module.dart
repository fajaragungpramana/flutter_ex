import 'package:flutter_ex/core/data/local/hive_manager.dart';
import 'package:flutter_ex/core/data/remote/app/app_remote_service.dart';
import 'package:get/get.dart';

class DiModule {
  const DiModule._();

  static void onInit() async {
    Get.lazyPut(() => HiveManager());
    Get.lazyPut(() => AppRemoteService(Get.find()));
  }

}