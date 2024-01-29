import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterController extends GetxController {

  final _appLocalization = AppLocalizations.of(Get.context as BuildContext)!;

  final RxString _fullName = "".obs;
  final RxString _email = "".obs;
  final RxString _password = "".obs;
  final RxString _confirmPassword = "".obs;

  final RxString _fullNameErrorMessage = "".obs;
  String get fullNameErrorMessage => _fullNameErrorMessage.value;

  final RxString _emailErrorMessage = "".obs;
  String get emailErrorMessage => _emailErrorMessage.value;

  final RxString _passwordErrorMessage = "".obs;
  String get passwordErrorMessage => _passwordErrorMessage.value;

  final RxString _confirmPasswordErrorMessage = "".obs;
  String get confirmPasswordErrorMessage => _confirmPasswordErrorMessage.value;

  final RxBool _isRegisterEnable = false.obs;
  bool get isRegisterEnable => _isRegisterEnable.value;

  void setFullName(String fullName) async {
    _fullNameErrorMessage.value = fullName.length >= 4 ? "" : _appLocalization.invalidFullNameFormat;

    _fullName.value = fullName;

    _onRegisterEnable();
  }

  void setEmail(String email) async {
    final isValidEmail = EmailValidator.validate(email);
    _emailErrorMessage.value = isValidEmail ? "" : _appLocalization.invalidEmailFormat;

    _email.value = email;

    _onRegisterEnable();
  }

  void setPassword(String password) async {
    _passwordErrorMessage.value = password.length >= 8 ? "" : _appLocalization.invalidPasswordFormat;

    _password.value = password;

    _onRegisterEnable();
  }

  void setConfirmPassword(String confirmPassword) async {
    _confirmPasswordErrorMessage.value = _password.value == confirmPassword ? "" : _appLocalization.invalidConfirmPasswordFormat;

    _confirmPassword.value = confirmPassword;

    _onRegisterEnable();
  }

  void _onRegisterEnable() async {
    _isRegisterEnable.value =
        _fullName.isNotEmpty && _fullNameErrorMessage.value.isEmpty &&
            _email.isNotEmpty && _emailErrorMessage.value.isEmpty &&
            _password.isNotEmpty && _passwordErrorMessage.value.isEmpty &&
            _confirmPassword.isNotEmpty && _confirmPasswordErrorMessage.value.isEmpty;
  }

}