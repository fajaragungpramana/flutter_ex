import 'package:flutter/material.dart';
import 'package:flutter_ex/extension/double_extension.dart';
import 'package:flutter_ex/extension/string_extension.dart';
import 'package:flutter_ex/pages/detail_wallet/detail_wallet_controller.dart';
import 'package:flutter_ex/resources/values/app_color.dart';
import 'package:flutter_ex/resources/values/app_style.dart';
import 'package:flutter_ex/widgets/views/ex_app_bar_sliver_persistent_header_delegate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DetailWalletPage extends GetView<DetailWalletController> {
  const DetailWalletPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
    ),
    body: NestedScrollView(
      headerSliverBuilder: (context, isScrolled) => [
        SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 180,
            collapsedHeight: 180,
            flexibleSpace: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      AppLocalizations.of(context)!.name,
                      style: AppStyle.textRegular(color: AppColor.black50)
                    ),

                    const SizedBox(height: 4),

                    Obx(() => Skeletonizer(
                        enabled: controller.walletLoading,
                        child: Text(
                            controller.walletResponse.name.orEmpty,
                            style: AppStyle.textSemiBold(fontSize: 24)
                        )
                    )),

                    const SizedBox(height: 16),

                    Text(
                        AppLocalizations.of(context)!.balance,
                        style: AppStyle.textRegular(color: AppColor.black50)
                    ),

                    const SizedBox(height: 4),

                    Obx(() => Skeletonizer(
                        enabled: controller.walletLoading,
                        child: Text(
                            controller.walletResponse.balance.currencyFormat,
                            style: AppStyle.textSemiBold(fontSize: 24)
                        )
                    )),

                    const SizedBox(height: 24),

                    const Divider(
                      color: AppColor.gray50,
                    )

                  ]
              ),
            ),
        ),
        SliverPersistentHeader(
          delegate: ExAppBarSliverPersistentHeaderDelegate(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              title: Text(
                AppLocalizations.of(context)!.historyTransaction,
                style: AppStyle.textSemiBold(fontSize: 14)
              )
            )
          ),
          floating: true,
          pinned: true,
        )
      ],
      body: Container(
        color: Colors.white,
      ),
    )
  );

}