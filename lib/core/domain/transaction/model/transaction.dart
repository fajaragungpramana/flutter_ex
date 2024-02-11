import 'package:flutter/material.dart';
import 'package:flutter_ex/core/data/remote/transaction/response/transaction_response.dart';
import 'package:flutter_ex/extension/double_extension.dart';
import 'package:flutter_ex/gen/assets.gen.dart';

class Transaction {
  final Image image;
  final String? name;
  final String? description;
  final double? amount;
  final String? dateTime;

  Transaction({
    required this.image,
    this.name,
    this.description,
    this.amount,
    this.dateTime
  });

  static mapToObject(TransactionResponse? transactionResponse) => Transaction(
      image: transactionResponse?.type == "DEBIT" ? Assets.lib.resources.drawables.icTransactionDebit.image() : Assets.lib.resources.drawables.icTransactionCredit.image(),
      name: transactionResponse?.name,
      description: transactionResponse?.description,
      amount: transactionResponse?.payment?.amount,
      dateTime: transactionResponse?.createdAt.dateFormat
  );

  static List<Transaction> mapToList(List<TransactionResponse>? listTransactionResponse) {
    final list = <Transaction>[];
    listTransactionResponse?.forEach((transactionResponse) {
      list.add(Transaction(
        image: transactionResponse.type == "DEBIT" ? Assets.lib.resources.drawables.icTransactionDebit.image() : Assets.lib.resources.drawables.icTransactionCredit.image(),
        name: transactionResponse.name,
        description: transactionResponse.description,
        amount: transactionResponse.payment?.amount,
        dateTime: transactionResponse.createdAt.dateFormat
      ));
    });

    return list;
  }
}