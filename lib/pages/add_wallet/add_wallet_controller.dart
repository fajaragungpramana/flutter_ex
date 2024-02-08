import 'package:flutter/material.dart';
import 'package:flutter_ex/core/domain/type/type_use_case.dart';
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

          Get.bottomSheet(
              const TypeBottomSheet(),
              shape: AppStyle.roundedRectangleCorner(topLeft: 16, topRight: 16),
              backgroundColor: Colors.white
          );

        },
        failure: (message) {

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