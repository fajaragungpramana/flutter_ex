import 'package:flutter_ex/core/remote/app/app_remote_service.dart';
import 'package:get/get.dart';

class DiModule {
  const DiModule._();

  static void onInit() async {
    Get.lazyPut(() => AppRemoteService());
  }

}