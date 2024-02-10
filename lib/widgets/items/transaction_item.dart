import 'package:flutter/cupertino.dart';
import 'package:flutter_ex/core/data/remote/transaction/response/transaction_response.dart';
import 'package:flutter_ex/extension/double_extension.dart';
import 'package:flutter_ex/extension/string_extension.dart';
import 'package:flutter_ex/gen/assets.gen.dart';
import 'package:flutter_ex/resources/values/app_color.dart';
import 'package:flutter_ex/resources/values/app_style.dart';

class TransactionItem extends StatelessWidget {
  final TransactionResponse transactionResponse;
  final Function(TransactionResponse) onTapItem;

  const TransactionItem({
    Key? key,
    required this.transactionResponse,
    required this.onTapItem
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () => { onTapItem(transactionResponse) },
    child: Container(
        padding: const EdgeInsets.only(bottom: 16),
        child: Row(
            children: [

              transactionResponse.type == "DEBIT" ?
              Assets.lib.resources.drawables.icTransactionDebit.image() : Assets.lib.resources.drawables.icTransactionCredit.image(),

              const SizedBox(width: 16),

              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                            transactionResponse.name.orEmpty,
                            style: AppStyle.textSemiBold(fontSize: 14),
                            overflow: TextOverflow.ellipsis
                        ),

                        const SizedBox(height: 4),

                        Text(
                            transactionResponse.description.orEmpty,
                            style: AppStyle.textRegular(fontSize: 12, color: AppColor.black50),
                            overflow: TextOverflow.ellipsis
                        )

                      ]
                  )
              ),

              const SizedBox(width: 16),

              Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    Text(
                        transactionResponse.payment!.amount.orZero.currencyFormat,
                        style: AppStyle.textSemiBold(fontSize: 14)
                    ),

                    const SizedBox(height: 4),

                    Text(
                      transactionResponse.createdAt.dateFormat,
                      style: AppStyle.textRegular(fontSize: 12, color: AppColor.black50),
                    )

                  ]
              )

            ]
        )
    )
  );

}