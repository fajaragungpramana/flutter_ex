import 'package:flutter_ex/pages/add_wallet/add_wallet_controller.dart';
import 'package:get/get.dart';

class AddWalletBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => AddWalletController());
  }

}