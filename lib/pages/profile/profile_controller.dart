import 'package:flutter_ex/core/domain/auth/auth_use_case.dart';
import 'package:flutter_ex/routes/app_route.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final AuthUseCase _authUseCase;

  ProfileController(this._authUseCase);

  void onLogout() {
    _authUseCase.clear();

    Get.offAndToNamed(AppRoute.login);
  }
}