import 'package:flutter/material.dart';
import 'package:flutter_ex/core/domain/auth/auth_use_case.dart';
import 'package:flutter_ex/core/domain/user/user_use_case.dart';
import 'package:flutter_ex/routes/app_route.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final AuthUseCase _authUseCase;
  final UserUseCase _userUseCase;

  ProfileController(this._authUseCase, this._userUseCase);

  void me() async {

    var result = await _userUseCase.me();
    result.when(
        success: (data) {
        },
        failure: (message) {
          Get.showSnackbar(
              GetSnackBar(
                message: message,
                duration: const Duration(seconds: 2),
                backgroundColor: Colors.red,
              )
          );
        },
        error: (e) {

        }
    );
  }

  void onLogout() {
    _authUseCase.clear();

    Get.offAndToNamed(AppRoute.login);
  }

}