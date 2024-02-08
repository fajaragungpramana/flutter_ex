import 'package:flutter/material.dart';
import 'package:flutter_ex/core/data/remote/user/response/wallet_response.dart';
import 'package:flutter_ex/core/domain/type/type_use_case.dart';
import 'package:flutter_ex/extension/string_extension.dart';
import 'package:flutter_ex/resources/values/app_style.dart';
import 'package:flutter_ex/widgets/bottom_sheets/type_bottom_sheet.dart';
import 'package:get/get.dart';

class AddWalletController extends GetxController {
  final TypeUseCase _typeUseCase;

  AddWalletController(this._typeUseCase);

  final nameController = TextEditingController();
  final typeController = TextEditingController();

  void listType() async {
    final response = await _typeUseCase.listType();
    response.when(
        success: (data) {
          if (data != null) {
            Get.bottomSheet(
                TypeBottomSheet(
                    listType: data,
                    onItemPressed: (typeResponse) {
                      typeController.text = WalletResponse.mapType(Get.context as BuildContext, typeResponse.name.orEmpty);

                      Get.back();
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

  @override
  void onClose() {
    nameController.dispose();
    typeController.dispose();

    super.onClose();
  }

}