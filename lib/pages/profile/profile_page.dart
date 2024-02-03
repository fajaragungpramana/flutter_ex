import 'package:flutter/material.dart';
import 'package:flutter_ex/pages/profile/profile_controller.dart';
import 'package:flutter_ex/resources/values/app_color.dart';
import 'package:flutter_ex/widgets/views/ex_button.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.me();

    return Container(
        padding: const EdgeInsets.all(16),
        child: Column(
            children: [

              const Spacer(),

              ExButton(
                  labelText: AppLocalizations.of(context)!.signOut,
                  labelColor: AppColor.red100,
                  backgroundColor: AppColor.red50,
                  onPressed: () {
                    controller.onLogout();
                  }
              )

            ]
        )
    );
  }
}