import 'package:flutter/material.dart';
import 'package:flutter_ex/pages/register/register_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../resources/values/app_color.dart';
import '../../resources/values/app_style.dart';

class RegisterPage extends GetView<RegisterController> {
  RegisterPage({Key? key}) : super(key: key);

  final _registerController = Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(16),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                    AppLocalizations.of(context)!.signUp,
                    style: AppStyle.textSemiBold()
                ),

                const SizedBox(height: 4),

                Text(
                    AppLocalizations.of(context)!.signInToContinueWithYourAccount,
                    style: AppStyle.textRegular(color: AppColor.black50)
                ),

                const SizedBox(height: 40),

                Obx(() => TextField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: AppColor.gray50),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        labelText: AppLocalizations.of(context)!.fullName,
                        errorText: _registerController.fullNameErrorMessage.isEmpty ? null : _registerController.fullNameErrorMessage
                    ),
                    onChanged: (text) {
                      _registerController.setFullName(text);
                    }
                )),

                const SizedBox(height: 8),

                Obx(() => TextField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: AppColor.gray50),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        labelText: AppLocalizations.of(context)!.email,
                        errorText: _registerController.emailErrorMessage.isEmpty ? null : _registerController.emailErrorMessage
                    ),
                    onChanged: (text) {
                      _registerController.setEmail(text);
                    }
                )),

                const SizedBox(height: 8),

                Obx(() => TextField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: AppColor.gray50),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        labelText: AppLocalizations.of(context)!.password,
                        suffixIcon: IconButton(
                            icon: Icon(
                                _registerController.isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                color: AppColor.gray50
                            ),
                            onPressed: () {
                              _registerController.setPasswordVisibility();
                            }
                        ),
                        errorText: _registerController.passwordErrorMessage.isEmpty ? null : _registerController.passwordErrorMessage
                    ),
                    obscureText: !_registerController.isPasswordVisible,
                    enableSuggestions: false,
                    autocorrect: false,
                    onChanged: (text) {
                      _registerController.setPassword(text);
                    }
                )),

                const SizedBox(height: 8),

                Obx(() => TextField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: AppColor.gray50),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        labelText: AppLocalizations.of(context)!.confirmPassword,
                        suffixIcon: IconButton(
                            icon: Icon(
                                _registerController.isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                color: AppColor.gray50
                            ),
                            onPressed: () {
                              _registerController.setConfirmPasswordVisibility();
                            }
                        ),
                        errorText: _registerController.confirmPasswordErrorMessage.isEmpty ? null : _registerController.confirmPasswordErrorMessage
                    ),
                    obscureText: !_registerController.isConfirmPasswordVisible,
                    enableSuggestions: false,
                    autocorrect: false,
                    onChanged: (text) {
                      _registerController.setConfirmPassword(text);
                    }
                )),

                const Spacer(),

                SizedBox(
                    width: double.infinity,
                    child: Obx(() => ElevatedButton(
                        onPressed: _registerController.isRegisterEnable ? () {} : null,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.green100,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)
                            )
                        ),
                        child: Text(
                            AppLocalizations.of(context)!.signIn,
                            style: AppStyle.textSemiBold(
                                fontSize: 16,
                                color: Colors.white
                            )
                        )
                    ))
                ),

                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text(
                          AppLocalizations.of(context)!.alreadyHaveAnAccount,
                          style: AppStyle.textRegular(
                              fontSize: 12,
                              color: AppColor.black50
                          )
                      ),

                      TextButton(
                          onPressed: () {

                          },
                          child: Text(
                              AppLocalizations.of(context)!.signIn,
                              style: AppStyle.textSemiBold(
                                  fontSize: 12,
                                  color: AppColor.green100
                              )
                          )
                      )

                    ]
                )

              ]
          )
        )
      )
    );
  }

}