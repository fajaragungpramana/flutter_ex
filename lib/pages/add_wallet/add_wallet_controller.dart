import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ex/core/data/remote/user/request/wallet_request.dart';
import 'package:flutter_ex/core/domain/type/type_use_case.dart';
import 'package:flutter_ex/core/domain/user/user_use_case.dart';
import 'package:flutter_ex/extension/double_extension.dart';
import 'package:flutter_ex/extension/string_extension.dart';
import 'package:flutter_ex/pages/add_wallet/add_wallet_event.dart';
import 'package:flutter_ex/pages/home/home_event.dart';
import 'package:flutter_ex/resources/values/app_color.dart';
import 'package:flutter_ex/resources/values/app_style.dart';
import 'package:flutter_ex/widgets/bottom_sheets/type_bottom_sheet.dart';
import 'package:flutter_ex/widgets/views/ex_hud_progress.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddWalletController extends GetxController {
  final EventBus _eventBus;
  final TypeUseCase _typeUseCase;
  final UserUseCase _userUseCase;

  AddWalletController(this._eventBus, this._typeUseCase, this._userUseCase);

  final nameController = TextEditingController();
  final typeController = TextEditingController();

  final _appLocalization = AppLocalizations.of(Get.context as BuildContext)!;

  final _isAddWalletEnable = false.obs;
  bool get isAddWalletEnable => _isAddWalletEnable.value;

  var _typeId = 0.0;

  @override
  void onInit() {
    nameController.addListener(() {
      _isAddWalletEnable.value = nameController.text.isNotEmpty && typeController.text.isNotEmpty;
    });
    typeController.addListener(() {
      _isAddWalletEnable.value = nameController.text.isNotEmpty && typeController.text.isNotEmpty;
    });

    super.onInit();
  }

  void setEvent(AddWalletEvent event) {
    switch (event) {
      case AddWalletEvent.listType:
        _listType();
      case AddWalletEvent.setWallet:
        _setWallet();
    }
  }

  void _listType() async {
    Get.dialog(const ExHudProgress());

    final response = await _typeUseCase.listType();

    Get.back();
    response.when(
        success: (data) {
          if (data != null) {
            Get.bottomSheet(
                TypeBottomSheet(
                    listType: data,
                    onItemTap: (type) {
                      Get.back();

                      _typeId = type.id.orZero;
                      typeController.text = type.name.orEmpty;
                    }
                ),
                shape: AppStyle.roundedRectangleCorner(
                    topLeft: 16, topRight: 16),
                backgroundColor: Colors.white
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
        error: (e) {

        }
    );
  }

  void _setWallet() async {
    Get.dialog(const ExHudProgress());

    final response = await _userUseCase.setWallet(WalletRequest(
      name: nameController.text,
      typeId: _typeId
    ));

    Get.back();
    response.when(
        success: (data) {
          Get.back();

          Get.snackbar(
            _appLocalization.addWalletSuccessfully,
            _appLocalization.addWalletSuccessfullyMessage,
            colorText: Colors.white,
            backgroundColor: AppColor.green100
          );

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
        error: (e) {

        });
  }

  @override
  void onClose() {
    nameController.dispose();
    typeController.dispose();

    super.onClose();
  }

}