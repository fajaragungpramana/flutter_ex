import 'package:flutter/material.dart';
import 'package:flutter_ex/core/data/remote/transaction/response/transaction_response.dart';
import 'package:flutter_ex/core/domain/transaction/model/transaction.dart';
import 'package:flutter_ex/extension/double_extension.dart';
import 'package:flutter_ex/extension/string_extension.dart';
import 'package:flutter_ex/pages/detail_wallet/detail_wallet_controller.dart';
import 'package:flutter_ex/resources/values/app_color.dart';
import 'package:flutter_ex/resources/values/app_style.dart';
import 'package:flutter_ex/routes/app_route.dart';
import 'package:flutter_ex/widgets/items/transaction_item.dart';
import 'package:flutter_ex/widgets/views/ex_app_bar_sliver_persistent_header_delegate.dart';
import 'package:flutter_ex/widgets/views/ex_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
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
                            controller.wallet.name.orEmpty,
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
                            controller.wallet.balance.currencyFormat,
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
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Column(
          children: [

            Expanded(
                child: PagedListView<int, Transaction>(
                    pagingController: controller.pagingController,
                    builderDelegate: PagedChildBuilderDelegate<Transaction>(
                        itemBuilder: (context, item, index) => TransactionItem(
                            transaction: item,
                            onTapItem: (transactionResponse) {  }
                        )
                    )
                )
            ),

            const SizedBox(height: 8),

            ExButton(
                labelText: AppLocalizations.of(context)!.addTransaction,
                onPressed: () => {
                  Get.toNamed(AppRoute.addTransaction, arguments: {
                    "id" : Get.arguments["id"]
                  })
                }
            )

          ]
        )
      )
    )
  );

}