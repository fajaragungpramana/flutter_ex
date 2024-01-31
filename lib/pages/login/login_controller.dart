import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ex/core/domain/auth/auth_use_case.dart';
import 'package:flutter_ex/core/remote/auth/request/login_request.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginController extends GetxController {

  final _authUseCase = Get.find<AuthUseCase>();

  final RxBool _isLoginEnable = false.obs;
  bool get isLoginEnable => _isLoginEnable.value;

  final RxString _email = "".obs;
  final RxString _password = "".obs;

  final RxString _emailErrorMessage = "".obs;
  String get emailErrorMessage => _emailErrorMessage.value;

  final RxString _passwordErrorMessage = "".obs;
  String get passwordErrorMessage => _passwordErrorMessage.value;

  void setEmail(String email) async {
    var isValidEmail = EmailValidator.validate(email);
    _emailErrorMessage.value = isValidEmail ? "" : AppLocalizations.of(Get.context as BuildContext)!.invalidEmailFormat;

    _email.value = email;

    _onLoginEnable();
  }

  void setPassword(String password) async {
    _passwordErrorMessage.value = "";

    _password.value = password;

    _onLoginEnable();
  }

  void _onLoginEnable() async {
    _isLoginEnable.value = _email.isNotEmpty && _emailErrorMessage.isEmpty &&
        _password.isNotEmpty && _passwordErrorMessage.isEmpty;
  }

  Future<void> onLogin() async {
    var result = await _authUseCase.login(LoginRequest(email: _email.value, password: _password.value));
    result.when(
        success: (data) {
        },
        failure: (message) {
        },
        error: (e) {
        });
  }

}
