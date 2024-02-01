import 'package:flutter/material.dart';
import 'package:flutter_ex/gen/assets.gen.dart';
import 'package:flutter_ex/pages/home/home_page.dart';
import 'package:flutter_ex/pages/main/main_controller.dart';
import 'package:flutter_ex/pages/profile/profile_page.dart';
import 'package:flutter_ex/pages/statistic/statistic_page.dart';
import 'package:flutter_ex/resources/values/app_color.dart';
import 'package:flutter_ex/resources/values/app_style.dart';
import 'package:flutter_ex/widgets/views/ex_collapse_scaffold.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainPage extends GetView<MainController> {
  MainPage({Key? key}) : super(key: key);

  final _mainController = Get.find<MainController>();

  List<String> _listTitle(BuildContext context) {
    return [
      AppLocalizations.of(context)!.home,
      AppLocalizations.of(context)!.statistic,
      AppLocalizations.of(context)!.profile
    ];
  }

  @override
  Widget build(BuildContext context) => ExCollapseScaffold(
      title: Obx(() => Text(
        _listTitle(context)[_mainController.bnvSelectedIndex],
        style: AppStyle.textSemiBold(),
      )),
      body: [

        Obx(() => IndexedStack(
          index: _mainController.bnvSelectedIndex,
            children: const [
              HomePage(),
              StatisticPage(),
              ProfilePage()
            ]
        ))

      ],
    bottomNavigationBar: Obx(() => BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        selectedFontSize: 12,
        selectedItemColor: AppColor.green100,
        selectedLabelStyle: AppStyle.textSemiBold(
            fontSize: 10,
            color: AppColor.green100
        ),
        currentIndex: _mainController.bnvSelectedIndex,
        onTap: (index) { _mainController.setBnvSelectedIndex(index); },
        items: [

          BottomNavigationBarItem(
              icon: _mainController.bnvSelectedIndex == 0 ? Assets.lib.resources.drawables.icHomeGreen.image() : Assets.lib.resources.drawables.icHomeGray.image(),
              label: AppLocalizations.of(context)!.home
          ),
          BottomNavigationBarItem(
              icon: _mainController.bnvSelectedIndex == 1 ? Assets.lib.resources.drawables.icStatisticGreen.image() : Assets.lib.resources.drawables.icStatisticGray.image(),
              label: AppLocalizations.of(context)!.statistic
          ),
          BottomNavigationBarItem(
              icon: _mainController.bnvSelectedIndex == 2 ? Assets.lib.resources.drawables.icProfileGreen.image() : Assets.lib.resources.drawables.icProfileGray.image(),
              label: AppLocalizations.of(context)!.profile
          )

        ]
    )),
  );

}