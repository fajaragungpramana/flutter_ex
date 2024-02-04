import 'package:flutter/material.dart';
import 'package:flutter_ex/core/domain/auth/auth_use_case.dart';
import 'package:flutter_ex/core/domain/user/user_use_case.dart';
import 'package:flutter_ex/extension/string_extension.dart';
import 'package:flutter_ex/routes/app_route.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final AuthUseCase _authUseCase;
  final UserUseCase _userUseCase;

  ProfileController(this._authUseCase, this._userUseCase);

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void onInit() {
    _me();

    super.onInit();
  }

  void _me() async {

    var result = await _userUseCase.me();
    result.when(
        success: (data) {
          if (data != null) {
            fullNameController.text = data.fullName.orEmpty;
            emailController.text = data.email.orEmpty;
          }
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