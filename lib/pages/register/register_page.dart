import 'package:flutter/material.dart';
import 'package:flutter_ex/pages/register/register_controller.dart';
import 'package:flutter_ex/widgets/views/ex_button.dart';
import 'package:flutter_ex/widgets/views/ex_flexible_space_bar.dart';
import 'package:flutter_ex/widgets/views/ex_text_field.dart';
import 'package:flutter_ex/widgets/views/ex_text_field_secure.dart';
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
      body: SafeArea(
        child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                expandedHeight: 100.0,
                pinned: true,
                floating: true,
                snap: false,
                flexibleSpace: ExFlexibleSpaceBar(
                  titlePadding: EdgeInsetsTween(
                      begin: const EdgeInsets.all(16),
                      end: const EdgeInsets.only(left: 56, top: 16, right: 16, bottom: 16)
                  ),
                  title: Text(
                      AppLocalizations.of(context)!.signUp,
                      style: AppStyle.textSemiBold()
                  ),
                ),
              )
            ],
            body: Container(
                color: Colors.white,
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text(
                                  AppLocalizations.of(context)!.signInToContinueWithYourAccount,
                                  style: AppStyle.textRegular(color: AppColor.black50)
                              ),

                              const SizedBox(height: 40),

                              Obx(() => ExTextField(
                                labelText: AppLocalizations.of(context)!.fullName,
                                errorText: _registerController.fullNameErrorMessage,
                                onChanged: (text) {
                                  _registerController.setFullName(text);
                                }
                              )),

                              const SizedBox(height: 16),

                              Obx(() => ExTextField(
                                labelText: AppLocalizations.of(context)!.email,
                                errorText: _registerController.emailErrorMessage,
                                onChanged: (text) {
                                    _registerController.setEmail(text);
                                }
                              )),

                              const SizedBox(height: 16),

                              Obx(() => ExTextFieldSecure(
                                labelText: AppLocalizations.of(context)!.password,
                                errorText: _registerController.passwordErrorMessage,
                                onChanged: (text) {
                                    _registerController.setPassword(text);
                                }
                              )),

                              const SizedBox(height: 16),

                              Obx(() => ExTextFieldSecure(
                                  labelText: AppLocalizations.of(context)!.confirmPassword,
                                  errorText: _registerController.confirmPasswordErrorMessage,
                                  onChanged: (text) {
                                    _registerController.setConfirmPassword(text);
                                  }
                              ))

                            ],
                          ),
                        )
                    ),

                    Obx(() => ExButton(
                        labelText: AppLocalizations.of(context)!.signIn,
                        enable: _registerController.isRegisterEnable,
                        onPressed: () { }
                    )),

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
                              onPressed: () {},
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

                  ],
                )
            )
        ),
      ),
    );
  }

}