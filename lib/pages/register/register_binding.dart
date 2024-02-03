import 'package:flutter_ex/core/data/remote/auth/auth_service.dart';
import 'package:flutter_ex/pages/register/register_controller.dart';
import 'package:get/get.dart';

class RegisterBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => AuthService(Get.find()));
    Get.lazyPut(() => RegisterController(Get.find()));
  }

}