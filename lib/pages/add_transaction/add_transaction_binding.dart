import 'package:flutter_ex/pages/add_transaction/add_transaction_controller.dart';
import 'package:get/get.dart';

class AddTransactionBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => AddTransactionController(Get.find(), Get.find(), Get.find()));
  }

}