import 'package:flutter/material.dart';
import 'package:flutter_ex/extension/double_extension.dart';
import 'package:flutter_ex/extension/string_extension.dart';
import 'package:flutter_ex/gen/assets.gen.dart';
import 'package:flutter_ex/pages/home/home_controller.dart';
import 'package:flutter_ex/resources/values/app_color.dart';
import 'package:flutter_ex/resources/values/app_style.dart';
import 'package:flutter_ex/routes/app_route.dart';
import 'package:flutter_ex/widgets/items/wallet_item.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
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
      body: RefreshIndicator(
          onRefresh: () async { controller.onRequest(); },
          child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()
              ),
              child: Container(
                color: AppColor.gray10,
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                visible: !controller.walletLoading && controller.listWalletResponse.isNotEmpty,
                                child: GestureDetector(
                                    onTap: () => { Get.toNamed(AppRoute.addWallet) },
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
                                        onPressed: () => { Get.toNamed(AppRoute.addWallet) },
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
                          height: 240,
                          child: Obx(() => ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.listWalletResponse.length,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) => Skeletonizer(
                                  enabled: controller.walletLoading,
                                  child: WalletItem(
                                      walletResponse: controller.listWalletResponse[index],
                                      onTapItem: (walletResponse) => {
                                        if (walletResponse.id != null) {
                                          Get.toNamed(
                                              AppRoute.detailWallet,
                                              arguments: {
                                                "id": walletResponse.id
                                              }
                                          )
                                        }
                                      }
                                  )
                              )
                          ))
                      )

                    ]
                )
              )
          )
      )
    );

}