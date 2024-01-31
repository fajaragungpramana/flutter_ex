import 'package:flutter_ex/core/domain/auth/auth_interactor.dart';
import 'package:flutter_ex/core/domain/auth/auth_use_case.dart';
import 'package:flutter_ex/core/remote/auth/auth_repository.dart';
import 'package:flutter_ex/core/remote/auth/auth_repository_impl.dart';
import 'package:flutter_ex/core/remote/auth/auth_service.dart';
import 'package:flutter_ex/pages/login/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => AuthService(Get.find()));
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(Get.find()));
    Get.lazyPut<AuthUseCase>(() => AuthInteractor(Get.find()));

    Get.lazyPut(() => LoginController());
  }

}