import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ex/core/data/remote/transaction/request/transaction_request.dart';
import 'package:flutter_ex/core/domain/transaction/transaction_use_case.dart';
import 'package:flutter_ex/pages/detail_wallet/detail_wallet_event.dart';
import 'package:flutter_ex/resources/values/app_color.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddTransactionController extends GetxController {
  final EventBus _eventBus;
  final TransactionUseCase _transactionUseCase;

  AddTransactionController(this._eventBus, this._transactionUseCase);

  final _appLocalization = AppLocalizations.of(Get.context as BuildContext)!;

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final amountController = TextEditingController();
  final categoryController = TextEditingController();

  final _isAddTransactionEnable = false.obs;
  get isAddTransactionEnable => _isAddTransactionEnable.value;

  void _setTransaction() async {
    final response = await _transactionUseCase.setTransaction(
        TransactionRequest(
          name: nameController.text,
          description: descriptionController.text,
          amount: 0,
          categoryId: 0,
          walletId: 1
        )
    );

    response.when(
        success: (data) {
          Get.back();

          Get.snackbar(
              _appLocalization.addTransactionSuccessfully,
              _appLocalization.addTransactionSuccessfullyMessage,
              colorText: Colors.white,
              backgroundColor: AppColor.green100
          );

          _eventBus.fire(DetailWalletEvent.refresh);
        },
        failure: (message) {
          Get.showSnackbar(
              GetSnackBar(
                message: message,
                duration: const Duration(seconds: 2),
                backgroundColor: Colors.red,
              )
          );
        },
        error: (e) {}
    );
  }

  @override
  void onClose() {
    nameController.dispose();
    descriptionController.dispose();
    amountController.dispose();
    categoryController.dispose();

    super.onClose();
  }

}