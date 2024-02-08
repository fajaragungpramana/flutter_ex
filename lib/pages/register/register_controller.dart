import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ex/core/data/remote/auth/auth_service.dart';
import 'package:flutter_ex/core/data/remote/auth/request/register_request.dart';
import 'package:flutter_ex/resources/values/app_color.dart';
import 'package:flutter_ex/widgets/views/ex_hud_progress.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterController extends GetxController {
  final AuthService _authService;

  RegisterController(this._authService);

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  final _appLocalization = AppLocalizations.of(Get.context as BuildContext)!;

  final _fullNameErrorMessage = "".obs;
  get fullNameErrorMessage => _fullNameErrorMessage.value;

  final _emailErrorMessage = "".obs;
  get emailErrorMessage => _emailErrorMessage.value;

  final _passwordErrorMessage = "".obs;
  get passwordErrorMessage => _passwordErrorMessage.value;

  final _confirmPasswordErrorMessage = "".obs;
  get confirmPasswordErrorMessage => _confirmPasswordErrorMessage.value;

  final _isRegisterEnable = false.obs;
  get isRegisterEnable => _isRegisterEnable.value;

  @override
  void onInit() {
    fullNameController.addListener(_setFullName);
    emailController.addListener(_setEmail);
    passwordController.addListener(_setPassword);
    passwordConfirmController.addListener(_setPasswordConfirm);

    super.onInit();
  }

  void _setFullName() async {
    _fullNameErrorMessage.value = fullNameController.text.length >= 4 ? "" : _appLocalization.invalidFullNameFormat;
    _onRegisterEnable();
  }

  void _setEmail() async {
    final isValidEmail = EmailValidator.validate(emailController.text);
    _emailErrorMessage.value = isValidEmail ? "" : _appLocalization.invalidEmailFormat;

    _onRegisterEnable();
  }

  void _setPassword() async {
    _passwordErrorMessage.value = passwordController.text.length >= 8 ? "" : _appLocalization.invalidPasswordFormat;

    _onRegisterEnable();
  }

  void _setPasswordConfirm() async {
    _confirmPasswordErrorMessage.value = passwordController.text == passwordConfirmController.text ? "" : _appLocalization.invalidConfirmPasswordFormat;

    _onRegisterEnable();
  }

  void _onRegisterEnable() async {
    _isRegisterEnable.value =
        fullNameController.text.isNotEmpty && _fullNameErrorMessage.value.isEmpty &&
            emailController.text.isNotEmpty && _emailErrorMessage.value.isEmpty &&
            passwordController.text.isNotEmpty && _passwordErrorMessage.value.isEmpty &&
            passwordConfirmController.text.isNotEmpty && _confirmPasswordErrorMessage.value.isEmpty;
  }

  void onRegister() async {
    Get.dialog(const ExHudProgress());

    var result = await _authService.register(RegisterRequest(
        fullName: fullNameController.text,
        email: emailController.text,
        password: passwordConfirmController.text
    ));

    Get.back();
    result.when(
        success: (data) {
          Get.back();

          Get.snackbar(
              _appLocalization.signUpSuccessfully,
              _appLocalization.signUpSuccessfullyMessage,
              colorText: Colors.white,
              backgroundColor: AppColor.green100
          );
        },
        failure: (message) {
          Get.showSnackbar(
              GetSnackBar(
                message: message,
                duration: const Duration(seconds: 2),
                backgroundColor: Colors.red,
              )
          );
        }, error: (e) {}
    );

  }

  @override
  void onClose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();

    super.onClose();
  }

}