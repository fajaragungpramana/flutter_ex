import 'package:flutter/material.dart';
import 'package:flutter_ex/gen/assets.gen.dart';
import 'package:flutter_ex/pages/profile/profile_controller.dart';
import 'package:flutter_ex/resources/values/app_color.dart';
import 'package:flutter_ex/resources/values/app_style.dart';
import 'package:flutter_ex/widgets/views/ex_bottom_sheet.dart';
import 'package:flutter_ex/widgets/views/ex_button.dart';
import 'package:flutter_ex/widgets/views/ex_text_field.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
            children: [

              ExTextField(
                  controller: controller.fullNameController,
                  labelText: AppLocalizations.of(context)!.fullName
              ),

              const SizedBox(height: 16),

              ExTextField(
                  controller: controller.emailController,
                  labelText: AppLocalizations.of(context)!.email
              ),

              const Spacer(),

              ExButton(
                  labelText: AppLocalizations.of(context)!.signOut,
                  labelColor: AppColor.red100,
                  backgroundColor: AppColor.red50,
                  onPressed: () {

                    Get.bottomSheet(
                      ExBottomSheet(
                          widget: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [

                                SizedBox(
                                    width: 80,
                                    height: 8,
                                    child: Assets.lib.resources.drawables.icSlider.image(
                                        fit: BoxFit.contain
                                    )
                                ),

                                const SizedBox(height: 24),

                                Text(
                                  AppLocalizations.of(context)!.areYouSureToSignOut,
                                  style: AppStyle.textSemiBold(),
                                ),

                                const SizedBox(height: 8),

                                Text(
                                    AppLocalizations.of(context)!.areYouSureToSignOutMessage,
                                    style: AppStyle.textRegular(color: AppColor.black50)
                                ),

                                const SizedBox(height: 24),

                                Row(
                                    children: [

                                      Expanded(
                                          child: ExButton(
                                              labelText: AppLocalizations.of(context)!.signOut,
                                              onPressed: () { controller.onLogout(); })
                                      ),

                                      const SizedBox(width: 16),

                                      Expanded(
                                          child: ExButton(
                                              labelText: AppLocalizations.of(context)!.cancel,
                                              labelColor: AppColor.green100,
                                              backgroundColor: AppColor.green50,
                                              onPressed: () { Get.back(); })
                                      )

                                    ]
                                )

                              ]
                          )
                      ),
                      shape: AppStyle.roundedRectangleCorner(topLeft: 16, topRight: 16),
                      backgroundColor: Colors.white
                    );

                  }
              )

            ]
        )
    );
  
}