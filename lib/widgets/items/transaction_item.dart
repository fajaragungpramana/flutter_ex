import 'package:flutter/material.dart';
import 'package:flutter_ex/core/domain/transaction/model/transaction.dart';
import 'package:flutter_ex/extension/double_extension.dart';
import 'package:flutter_ex/extension/string_extension.dart';
import 'package:flutter_ex/resources/values/app_color.dart';
import 'package:flutter_ex/resources/values/app_style.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;
  final Function(Transaction) onTapItem;

  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.onTapItem
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () => { onTapItem(transaction) },
    child: Container(
        padding: const EdgeInsets.only(bottom: 16),
        child: Row(
            children: [

              transaction.image,

              const SizedBox(width: 16),

              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                            transaction.name.orEmpty,
                            style: AppStyle.textSemiBold(fontSize: 14),
                            overflow: TextOverflow.ellipsis
                        ),

                        const SizedBox(height: 4),

                        Text(
                            transaction.description.orEmpty,
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
                        transaction.amount.currencyFormat,
                        style: AppStyle.textSemiBold(fontSize: 14)
                    ),

                    const SizedBox(height: 4),

                    Text(
                      transaction.dateTime.orEmpty,
                      style: AppStyle.textRegular(fontSize: 12, color: AppColor.black50),
                    )

                  ]
              )

            ]
        )
    )
  );

}