import 'package:flutter/material.dart';
import 'package:flutter_ex/core/data/remote/user/response/wallet_response.dart';
import 'package:flutter_ex/core/domain/user/user_use_case.dart';
import 'package:get/get.dart';

class DetailWalletController extends GetxController {
  final UserUseCase _userUseCase;

  DetailWalletController(this._userUseCase);

  final _walletLoading = true.obs;
  get walletLoading => _walletLoading.value;

  final Rx<WalletResponse> _walletResponse = const WalletResponse().obs;
  WalletResponse get walletResponse => _walletResponse.value;

  @override
  void onInit() async {
    final id = Get.arguments["id"];
    if (id != null) {
      _getWallet(id);
    }

    super.onInit();
  }

  void _getWallet(double? id) async {
    _walletLoading.value = true;
    _walletResponse.value = WalletResponse.skeleton();

    final response = await _userUseCase.getWallet(id);

    response.when(
        success: (data) {
          if (data != null) {
            _walletLoading.value = false;
            _walletResponse.value = data;
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

}