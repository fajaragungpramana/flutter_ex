import 'package:flutter/material.dart';
import 'package:flutter_ex/pages/login/login_controller.dart';
import 'package:flutter_ex/resources/values/app_color.dart';
import 'package:flutter_ex/resources/values/app_style.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends GetView<LoginController> {
  LoginPage({Key? key}) : super(key: key);

  final _loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                AppLocalizations.of(context)!.signIn,
                style: AppStyle.textSemiBold()
              ),

              const SizedBox(height: 4),

              Text(
                AppLocalizations.of(context)!.signInToContinueWithYourAccount,
                style: AppStyle.textRegular(color: AppColor.black50)
              ),

              const SizedBox(height: 40),
              
              TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColor.gray50),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  labelText: AppLocalizations.of(context)!.email
                )
              ),

              const SizedBox(height: 8),

              TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: AppColor.gray50),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      labelText: AppLocalizations.of(context)!.password
                  )
              ),

              const SizedBox(height: 16),

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

              const Spacer(),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {},
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
                )
              ),

              const SizedBox(height: 16),

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

                  const SizedBox(width: 4),

                  Text(
                    AppLocalizations.of(context)!.signUp,
                    style: AppStyle.textSemiBold(
                        fontSize: 12,
                        color: AppColor.green100
                    )
                  )

                ]
              )

            ],
          ),
        ),
      ),
    );
  }
}
