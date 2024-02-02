import 'package:flutter_ex/core/data/remote/auth/auth_repository.dart';
import 'package:flutter_ex/core/data/remote/auth/auth_repository_impl.dart';
import 'package:flutter_ex/core/data/remote/auth/auth_service.dart';
import 'package:flutter_ex/core/data/remote/user/user_repository.dart';
import 'package:flutter_ex/core/data/remote/user/user_repository_impl.dart';
import 'package:flutter_ex/core/data/remote/user/user_service.dart';
import 'package:flutter_ex/core/domain/auth/auth_interactor.dart';
import 'package:flutter_ex/core/domain/auth/auth_use_case.dart';
import 'package:flutter_ex/core/domain/user/user_interactor.dart';
import 'package:flutter_ex/core/domain/user/user_use_case.dart';
import 'package:flutter_ex/pages/home/home_controller.dart';
import 'package:flutter_ex/pages/main/main_controller.dart';
import 'package:flutter_ex/pages/profile/profile_controller.dart';
import 'package:flutter_ex/pages/statistic/statistic_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => AuthService(Get.find()));
    Get.lazyPut(() => UserService(Get.find()));

    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(Get.find(), Get.find()));
    Get.lazyPut<UserRepository>(() => UserRepositoryImpl(Get.find()));

    Get.lazyPut<AuthUseCase>(() => AuthInteractor(Get.find()));
    Get.lazyPut<UserUseCase>(() => UserInteractor(Get.find()));

    Get.lazyPut(() => MainController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => StatisticController());
    Get.lazyPut(() => ProfileController(Get.find(), Get.find()));
  }

}