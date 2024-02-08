import 'package:event_bus/event_bus.dart';
import 'package:flutter_ex/core/data/di/data_module.dart';
import 'package:flutter_ex/core/domain/di/domain_module.dart';
import 'package:get/get.dart';

class AppModule {
  const AppModule._();

  static void onInit() async {

    Get.put(EventBus(), permanent: true);

    DataModule.onInit();
    DomainModule.onInit();

  }

}