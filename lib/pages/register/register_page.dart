import 'package:flutter/material.dart';
import 'package:flutter_ex/pages/register/register_controller.dart';
import 'package:flutter_ex/resources/values/app_color.dart';
import 'package:flutter_ex/resources/values/app_style.dart';
import 'package:flutter_ex/widgets/views/ex_button.dart';
import 'package:flutter_ex/widgets/views/ex_collapse_scaffold.dart';
import 'package:flutter_ex/widgets/views/ex_text_field.dart';
import 'package:flutter_ex/widgets/views/ex_text_field_secure.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) => ExCollapseScaffold(
      backEnable: Get.previousRoute.isNotEmpty,
      collapseEnable: false,
      title: Text(
          AppLocalizations.of(context)!.signUp,
          style: AppStyle.textSemiBold(),
      ),
      body: [

        Text(
            AppLocalizations.of(context)!.signInToContinueWithYourAccount,
            style: AppStyle.textRegular(color: AppColor.black50)
        ),

        const SizedBox(height: 40),

        Obx(() => ExTextField(
            labelText: AppLocalizations.of(context)!.fullName,
            errorText: controller.fullNameErrorMessage,
            onChanged: (text) {
              controller.setFullName(text);
            })),

        const SizedBox(height: 16),

        Obx(() => ExTextField(
            labelText: AppLocalizations.of(context)!.email,
            errorText: controller.emailErrorMessage,
            onChanged: (text) {
              controller.setEmail(text);
            })),

        const SizedBox(height: 16),

        Obx(() => ExTextFieldSecure(
            labelText: AppLocalizations.of(context)!.password,
            errorText: controller.passwordErrorMessage,
            onChanged: (text) {
              controller.setPassword(text);
            })),

        const SizedBox(height: 16),

        Obx(() => ExTextFieldSecure(
            labelText: AppLocalizations.of(context)!.confirmPassword,
            errorText: controller.confirmPasswordErrorMessage,
            onChanged: (text) {
              controller.setConfirmPassword(text);
            })),

        const SizedBox(height: 40)

      ],
      footer: Column(
        children: [

          Obx(() => ExButton(
              labelText: AppLocalizations.of(context)!.signIn,
              enable: controller.isRegisterEnable,
              onPressed: () { controller.onRegister(); }
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
                    onPressed: () { Get.back(); },
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
  );

}