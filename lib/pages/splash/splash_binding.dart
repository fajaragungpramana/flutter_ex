import 'package:flutter_ex/core/data/remote/auth/auth_repository.dart';
import 'package:flutter_ex/core/data/remote/auth/auth_repository_impl.dart';
import 'package:flutter_ex/core/data/remote/auth/auth_service.dart';
import 'package:flutter_ex/core/domain/auth/auth_interactor.dart';
import 'package:flutter_ex/core/domain/auth/auth_use_case.dart';
import 'package:flutter_ex/pages/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => AuthService(Get.find()));
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(Get.find(), Get.find()));
    Get.lazyPut<AuthUseCase>(() => AuthInteractor(Get.find()));

    Get.lazyPut(() => SplashController(Get.find()));
  }

}