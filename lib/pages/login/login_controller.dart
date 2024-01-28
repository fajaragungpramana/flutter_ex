import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginController extends GetxController {

  final RxBool _isLoginEnable = false.obs;
  bool get isLoginEnable => _isLoginEnable.value;

  final RxString _email = "".obs;
  final RxString _password = "".obs;

  final RxString _emailErrorMessage = "".obs;
  String get emailErrorMessage => _emailErrorMessage.value;

  final RxBool _isPasswordVisible = false.obs;
  bool get isPasswordVisible => _isPasswordVisible.value;

  final RxString _passwordErrorMessage = "".obs;
  String get passwordErrorMessage => _passwordErrorMessage.value;

  void setEmail(String email) async {
    var isValidEmail = EmailValidator.validate(email);
    _emailErrorMessage.value = isValidEmail ? "" : AppLocalizations.of(Get.context as BuildContext)!.invalidEmailFormat;

    _email.value = email;

    _isLoginEnable.value = isValidEmail && _password.value.isNotEmpty;
  }

  void setPasswordVisibility() async {
    _isPasswordVisible.value = !_isPasswordVisible.value;
  }

  void setPassword(String password) async {
    _passwordErrorMessage.value = "";

    _password.value = password;

    _isLoginEnable.value = EmailValidator.validate(_email.value) && _password.value.isNotEmpty;
  }
}
