import 'package:flutter_ex/pages/detail_wallet/detail_wallet_controller.dart';
import 'package:get/get.dart';

class DetailWalletBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => DetailWalletController(Get.find(), Get.find()));
  }

}