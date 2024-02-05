import 'package:flutter/material.dart';
import 'package:flutter_ex/core/data/remote/user/response/user_response.dart';
import 'package:flutter_ex/core/domain/user/user_use_case.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final UserUseCase _userUseCase;

  HomeController(this._userUseCase);

  final Rx<UserResponse> _userResponse = const UserResponse().obs;
  UserResponse get userResponse => _userResponse.value;

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
            _userResponse.value = data;
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

}