import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddTransactionController extends GetxController {

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final amountController = TextEditingController();
  final categoryController = TextEditingController();

  final _isAddTransactionEnable = false.obs;
  get isAddTransactionEnable => _isAddTransactionEnable.value;

  @override
  void onClose() {
    nameController.dispose();
    descriptionController.dispose();
    amountController.dispose();
    categoryController.dispose();

    super.onClose();
  }

}