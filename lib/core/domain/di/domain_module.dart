import 'package:flutter_ex/core/domain/auth/auth_interactor.dart';
import 'package:flutter_ex/core/domain/auth/auth_use_case.dart';
import 'package:flutter_ex/core/domain/type/type_interactor.dart';
import 'package:flutter_ex/core/domain/type/type_use_case.dart';
import 'package:flutter_ex/core/domain/user/user_interactor.dart';
import 'package:flutter_ex/core/domain/user/user_use_case.dart';
import 'package:get/get.dart';

class DomainModule {
  const DomainModule._();

  static void onInit() async {
    Get.put<AuthUseCase>(AuthInteractor(Get.find()), permanent: true);
    Get.put<UserUseCase>(UserInteractor(Get.find()), permanent: true);
    Get.put<TypeUseCase>(TypeInteractor(Get.find()), permanent: true);
  }
}