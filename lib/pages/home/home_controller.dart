import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_ex/core/data/remote/user/response/user_response.dart';
import 'package:flutter_ex/core/data/remote/user/response/wallet_response.dart';
import 'package:flutter_ex/core/domain/user/user_use_case.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final UserUseCase _userUseCase;

  HomeController(this._userUseCase);

  final _userLoading = true.obs;
  bool get userLoading => _userLoading.value;

  final Rx<UserResponse> _userResponse = const UserResponse().obs;
  UserResponse get userResponse => _userResponse.value;

  final RxList<WalletResponse> _listWalletResponse = <WalletResponse>[].obs;
  List<WalletResponse> get listWalletResponse => _listWalletResponse;

  @override
  void onInit() {
    onRequest();

    super.onInit();
  }

  void onRequest() async {
    _me();
    _listWallet();
  }

  void _me() async {
    _userResponse.value = UserResponse.skeleton();

    var result = await _userUseCase.me();
    result.when(
        success: (data) {
          if (data != null) {
            _userLoading.value = false;
            _userResponse.value = data;
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

  void _listWallet() async {
    var result = await _userUseCase.listWallet();
    result.when(
        success: (data) {
          if (data != null) {
            _listWalletResponse.addAll(data);
          }
        },
        failure: (message) {

        },
        error: (e) {

        }
    );
  }

}