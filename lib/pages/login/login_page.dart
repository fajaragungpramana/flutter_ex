import 'package:flutter/material.dart';
import 'package:flutter_ex/pages/login/login_controller.dart';
import 'package:flutter_ex/resources/values/app_color.dart';
import 'package:flutter_ex/resources/values/app_style.dart';
import 'package:flutter_ex/routes/app_route.dart';
import 'package:flutter_ex/widgets/views/ex_button.dart';
import 'package:flutter_ex/widgets/views/ex_collapse_scaffold.dart';
import 'package:flutter_ex/widgets/views/ex_horizontal_text_button.dart';
import 'package:flutter_ex/widgets/views/ex_text_field.dart';
import 'package:flutter_ex/widgets/views/ex_text_field_secure.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) => ExCollapseScaffold(
      backEnable: Get.previousRoute.isNotEmpty,
      collapseEnable: false,
      title: Text(
          AppLocalizations.of(context)!.signIn,
          style: AppStyle.textSemiBold(),
      ),
      footer: Column(
        children: [

          Obx(() => ExButton(
              labelText: AppLocalizations.of(context)!.signIn,
              enable: controller.isLoginEnable,
              onPressed: () => controller.onLogin()
          )),

          const SizedBox(height: 16),

          ExHorizontalTextButton(
              labelText: AppLocalizations.of(context)!.dontHaveAnAccount,
              buttonText: AppLocalizations.of(context)!.signUp,
              onTap: () => Get.toNamed(AppRoute.register)
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
            controller: controller.emailController,
            labelText: AppLocalizations.of(context)!.email,
            errorText: controller.emailErrorMessage
        )),

        const SizedBox(height: 16),

        ExTextFieldSecure(
            controller: controller.passwordController,
            labelText: AppLocalizations.of(context)!.password
        ),

        const SizedBox(height: 16),

        Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
                onTap: () {},
                child: Text(
                  AppLocalizations.of(context)!.forgotPassword,
                  style: AppStyle.textSemiBold(fontSize: 14, color: AppColor.green100),
                )
            )
        ),

        const SizedBox(height: 40)

      ]
  );

}
