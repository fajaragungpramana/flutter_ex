import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ex/core/data/remote/category/response/category_response.dart';
import 'package:flutter_ex/core/data/remote/transaction/request/transaction_request.dart';
import 'package:flutter_ex/core/domain/category/category_use_case.dart';
import 'package:flutter_ex/core/domain/transaction/transaction_use_case.dart';
import 'package:flutter_ex/extension/double_extension.dart';
import 'package:flutter_ex/extension/string_extension.dart';
import 'package:flutter_ex/pages/detail_wallet/detail_wallet_event.dart';
import 'package:flutter_ex/pages/home/home_event.dart';
import 'package:flutter_ex/resources/values/app_color.dart';
import 'package:flutter_ex/resources/values/app_style.dart';
import 'package:flutter_ex/widgets/bottom_sheets/category_bottom_sheet.dart';
import 'package:flutter_ex/widgets/views/ex_hud_progress.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddTransactionController extends GetxController {
  final EventBus _eventBus;
  final TransactionUseCase _transactionUseCase;
  final CategoryUseCase _categoryUseCase;

  AddTransactionController(this._eventBus, this._transactionUseCase, this._categoryUseCase);

  final _appLocalization = AppLocalizations.of(Get.context as BuildContext)!;

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final amountController = TextEditingController();
  final categoryController = TextEditingController();

  final _isAddTransactionEnable = false.obs;
  get isAddTransactionEnable => _isAddTransactionEnable.value;

  var _categoryId = 0.0;

  @override
  void onInit() {
    nameController.addListener(_isAddTransaction);
    descriptionController.addListener(_isAddTransaction);
    amountController.addListener(_isAddTransaction);
    categoryController.addListener(_isAddTransaction);

    super.onInit();
  }

  void listCategory() async {
    Get.dialog(const ExHudProgress());
    final response = await _categoryUseCase.listCategory();

    Get.back();
    response.when(
        success: (data) {
          if (data != null) {
            Get.bottomSheet(
                CategoryBottomSheet(
                    listCategory: data,
                    onItemTap: (categoryResponse) {
                      Get.back();

                      _categoryId = categoryResponse.id.orZero;
                      categoryController.text = CategoryResponse.mapName(Get.context as BuildContext, categoryResponse.name.orEmpty);
                    }
                ),
                shape: AppStyle.roundedRectangleCorner(topLeft: 16, topRight: 16),
                backgroundColor: Colors.white,
                isScrollControlled: true
            );
          }
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

  void setTransaction() async {
    final response = await _transactionUseCase.setTransaction(
        TransactionRequest(
          name: nameController.text,
          description: descriptionController.text,
          amount: double.parse(amountController.text),
          categoryId: _categoryId,
          walletId: Get.arguments["id"]
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
          _eventBus.fire(HomeEvent.refresh);
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

  void _isAddTransaction() async {
    _isAddTransactionEnable.value =
        nameController.text.isNotEmpty && descriptionController.text.isNotEmpty &&
            amountController.text.isNotEmpty && categoryController.text.isNotEmpty;
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