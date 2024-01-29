import 'package:flutter/material.dart';
import 'package:flutter_ex/pages/login/login_controller.dart';
import 'package:flutter_ex/resources/values/app_color.dart';
import 'package:flutter_ex/resources/values/app_style.dart';
import 'package:flutter_ex/routes/app_route.dart';
import 'package:flutter_ex/widgets/views/ex_button.dart';
import 'package:flutter_ex/widgets/views/ex_collapse_scaffold.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../widgets/views/ex_text_field.dart';
import '../../widgets/views/ex_text_field_secure.dart';

class LoginPage extends GetView<LoginController> {
  LoginPage({Key? key}) : super(key: key);

  final _loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) => ExCollapseScaffold(
      backEnable: Get.previousRoute.isNotEmpty,
      collapseEnable: false,
      title: Text(
          AppLocalizations.of(context)!.signIn,
          style: AppStyle.textSemiBold(),
      ),
      body: [

        Text(
            AppLocalizations.of(context)!.signInToContinueWithYourAccount,
            style: AppStyle.textRegular(color: AppColor.black50)
        ),

        const SizedBox(height: 40),

        Obx(() => ExTextField(
            labelText: AppLocalizations.of(context)!.email,
            errorText: _loginController.emailErrorMessage,
            onChanged: (text) {
              _loginController.setEmail(text);
            })),

        const SizedBox(height: 16),

        Obx(() => ExTextFieldSecure(
            labelText: AppLocalizations.of(context)!.password,
            errorText: _loginController.passwordErrorMessage,
            onChanged: (text) {
              _loginController.setPassword(text);
            })),

        Align(
            alignment: Alignment.centerRight,
            child: TextButton(
                onPressed: () {},
                child: Text(
                  AppLocalizations.of(context)!.forgotPassword,
                  style: AppStyle.textSemiBold(fontSize: 16, color: AppColor.green100),
                )
            )
        ),

        const SizedBox(height: 40)

      ],
      footer: Column(
        children: [

          Obx(() => ExButton(
              labelText: AppLocalizations.of(context)!.signIn,
              enable: _loginController.isLoginEnable,
              onPressed: () {
                Get.offAllNamed(AppRoute.main);
              }
          )),

          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text(
                    AppLocalizations.of(context)!.dontHaveAnAccount,
                    style: AppStyle.textRegular(
                        fontSize: 12,
                        color: AppColor.black50
                    )
                ),

                TextButton(
                    onPressed: () { Get.toNamed(AppRoute.register); },
                    child: Text(
                        AppLocalizations.of(context)!.signUp,
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
