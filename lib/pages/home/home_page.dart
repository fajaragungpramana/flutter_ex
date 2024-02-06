import 'package:flutter/material.dart';
import 'package:flutter_ex/extension/double_extension.dart';
import 'package:flutter_ex/extension/string_extension.dart';
import 'package:flutter_ex/gen/assets.gen.dart';
import 'package:flutter_ex/pages/home/home_controller.dart';
import 'package:flutter_ex/resources/values/app_color.dart';
import 'package:flutter_ex/resources/values/app_style.dart';
import 'package:flutter_ex/widgets/items/wallet_item.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: AppColor.gray10,
        title: Obx(() => Skeletonizer(
            enabled: controller.userLoading,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                      controller.userResponse.fullName.orEmpty,
                      style: AppStyle.textSemiBold(fontSize: 20)
                  ),

                  Text(
                      controller.userResponse.email.orEmpty,
                      style: AppStyle.textRegular(
                          color: AppColor.black50,
                          fontSize: 14
                      )
                  )

                ]
            )
        )),
        actions: [

          Padding(
              padding: const EdgeInsets.only(right: 16),
              child: GestureDetector(
                  onTap: () { },
                  child: Assets.lib.resources.drawables.icNotification.image()
              )
          )

        ]
      ),
      body: Container(
        color: AppColor.gray10,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: RefreshIndicator(
          onRefresh: () async { controller.onRequest(); },
          child: ListView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()
              ),
              children: [

                const SizedBox(height: 16),

                Row(
                    children: [

                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(
                                AppLocalizations.of(context)!.totalBalance,
                                style: AppStyle.textRegular(color: AppColor.black50)
                            ),

                            const SizedBox(height: 2),

                            Obx(() => Skeletonizer(
                                enabled: controller.walletLoading,
                                child: Text(
                                  controller.totalBalance.currencyFormat,
                                  style: AppStyle.textSemiBold(fontSize: 20),
                                )
                            ))

                          ]
                      ),

                      const Spacer(),

                      Obx(() => Visibility(
                          visible: controller.listWalletResponse.isNotEmpty,
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                AppLocalizations.of(context)!.addWallet,
                                style: AppStyle.textSemiBold(color: AppColor.green100, fontSize: 14),
                              )
                          )
                      ))

                    ]
                ),

                const SizedBox(height: 16),

                Obx(() => Visibility(
                    visible: controller.listWalletResponse.isEmpty,
                    child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: AppColor.green10,
                            borderRadius: BorderRadius.circular(16)
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              Assets.lib.resources.drawables.icWalletGreen.image(),

                              const SizedBox(height: 16),

                              Text(
                                  AppLocalizations.of(context)!.ops,
                                  style: AppStyle.textSemiBold()
                              ),

                              const SizedBox(height: 8),

                              Text(
                                  AppLocalizations.of(context)!.notHaveWallets,
                                  style: AppStyle.textRegular(color: AppColor.black50)
                              ),

                              const SizedBox(height: 16),

                              TextButton(
                                  onPressed: () => {},
                                  child: Text(
                                      AppLocalizations.of(context)!.createOne,
                                      style: AppStyle.textSemiBold(
                                          fontSize: 16,
                                          color: AppColor.green100
                                      )
                                  )
                              )

                            ]
                        )
                    )
                )),

                SizedBox(
                    height: 190,
                    child: Obx(() => ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()
                        ),
                        itemCount: controller.listWalletResponse.length,
                        itemBuilder: (context, index) => Skeletonizer(
                            enabled: controller.walletLoading,
                            child: WalletItem(walletResponse: controller.listWalletResponse[index])
                        )
                    ))
                )

              ]
          )
        )
      )
    );
  }
}