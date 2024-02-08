import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ex/core/data/remote/auth/request/login_request.dart';
import 'package:flutter_ex/core/domain/auth/auth_use_case.dart';
import 'package:flutter_ex/routes/app_route.dart';
import 'package:flutter_ex/widgets/views/ex_hud_progress.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginController extends GetxController {
  final AuthUseCase _authUseCase;

  LoginController(this._authUseCase);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _isLoginEnable = false.obs;
  get isLoginEnable => _isLoginEnable.value;

  final _emailErrorMessage = "".obs;
  get emailErrorMessage => _emailErrorMessage.value;

  @override
  void onInit() {
    emailController.addListener(_setEmail);
    passwordController.addListener(_setPassword);

    super.onInit();
  }

  void _setEmail() async {
    var isValidEmail = EmailValidator.validate(emailController.text);
    _emailErrorMessage.value = isValidEmail ? "" : AppLocalizations.of(Get.context as BuildContext)!.invalidEmailFormat;

    _onLoginEnable();
  }

  void _setPassword() async => _onLoginEnable();

  void _onLoginEnable() async {
    var email = emailController.text;
    var password = passwordController.text;

    _isLoginEnable.value = email.isNotEmpty && _emailErrorMessage.isEmpty && password.isNotEmpty;
  }

  void onLogin() async {
    Get.dialog(const ExHudProgress());

    var email = emailController.text;
    var password = passwordController.text;
    var result = await _authUseCase.login(LoginRequest(email: email, password: password));

    Get.back();
    result.when(
        success: (data) {
          Get.offAllNamed(AppRoute.main);
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
        error: (e) {}
    );
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();

    super.onClose();
  }

}
