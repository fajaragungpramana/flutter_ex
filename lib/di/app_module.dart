import 'package:flutter_ex/core/data/di/data_module.dart';
import 'package:flutter_ex/core/domain/di/domain_module.dart';

class AppModule {
  const AppModule._();

  static void onInit() async {

    DataModule.onInit();
    DomainModule.onInit();

  }

}