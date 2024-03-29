import 'package:flutter/material.dart';
import 'package:flutter_ex/pages/register/register_controller.dart';
import 'package:flutter_ex/pages/register/register_event.dart';
import 'package:flutter_ex/resources/values/app_color.dart';
import 'package:flutter_ex/resources/values/app_style.dart';
import 'package:flutter_ex/widgets/views/ex_button.dart';
import 'package:flutter_ex/widgets/views/ex_collapse_scaffold.dart';
import 'package:flutter_ex/widgets/views/ex_horizontal_text_button.dart';
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
      footer: Column(
        children: [

          Obx(() => ExButton(
              labelText: AppLocalizations.of(context)!.signIn,
              enable: controller.isRegisterEnable,
              onPressed: () => controller.setEvent(RegisterEvent.register)
          )),

          const SizedBox(height: 16),

          ExHorizontalTextButton(
              labelText: AppLocalizations.of(context)!.alreadyHaveAnAccount,
              buttonText: AppLocalizations.of(context)!.signIn,
              onTap: () => Get.back()
          )

        ]
      ),
      children: [

        Text(
            AppLocalizations.of(context)!.signInToContinueWithYourAccount,
            style: AppStyle.textRegular(color: AppColor.black50)
        ),

        const SizedBox(height: 40),

        Obx(() => ExTextField(
            controller: controller.fullNameController,
            labelText: AppLocalizations.of(context)!.fullName,
            errorText: controller.fullNameErrorMessage
        )),

        const SizedBox(height: 16),

        Obx(() => ExTextField(
            controller: controller.emailController,
            labelText: AppLocalizations.of(context)!.email,
            errorText: controller.emailErrorMessage
        )),

        const SizedBox(height: 16),

        Obx(() => ExTextFieldSecure(
            controller: controller.passwordController,
            labelText: AppLocalizations.of(context)!.password,
            errorText: controller.passwordErrorMessage
        )),

        const SizedBox(height: 16),

        Obx(() => ExTextFieldSecure(
            controller: controller.passwordConfirmController,
            labelText: AppLocalizations.of(context)!.confirmPassword,
            errorText: controller.confirmPasswordErrorMessage
        )),

        const SizedBox(height: 40)

      ]
  );

}