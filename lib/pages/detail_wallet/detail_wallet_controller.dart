import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ex/core/domain/transaction/model/transaction.dart';
import 'package:flutter_ex/core/domain/transaction/transaction_use_case.dart';
import 'package:flutter_ex/core/domain/user/model/wallet.dart';
import 'package:flutter_ex/core/domain/user/user_use_case.dart';
import 'package:flutter_ex/pages/detail_wallet/detail_wallet_event.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class DetailWalletController extends GetxController {
  final EventBus _eventBus;
  final UserUseCase _userUseCase;
  final TransactionUseCase _transactionUseCase;

  DetailWalletController(this._eventBus, this._userUseCase, this._transactionUseCase);

  final PagingController<int, Transaction> pagingController = PagingController(firstPageKey: 1);

  final _walletLoading = true.obs;
  get walletLoading => _walletLoading.value;

  final Rx<Wallet> _wallet = Wallet().obs;
  Wallet get wallet => _wallet.value;

  var _listTransactionPage = 1;

  @override
  void onInit() async {
    setEvent(DetailWalletEvent.wallet);
    pagingController.addPageRequestListener((pageKey) {
      setEvent(DetailWalletEvent.listTransaction);
    });

    _eventBus.on<DetailWalletEvent>().listen((event) {
      if (event == DetailWalletEvent.refresh) {
        setEvent(DetailWalletEvent.refresh);
      }
    });

    super.onInit();
  }

  void setEvent(DetailWalletEvent event) {
    final id = Get.arguments["id"];

    switch (event) {
      case DetailWalletEvent.wallet:
        _getWallet(id);
      case DetailWalletEvent.listTransaction:
        _listTransaction(id);
      case DetailWalletEvent.refresh: {
          _getWallet(id);
          _listTransaction(id);
      }
    }
  }

  void _getWallet(double? id) async {
    _walletLoading.value = true;
    _wallet.value = Wallet.skeleton();

    final response = await _userUseCase.getWallet(id);

    response.when(
        success: (data) {
          if (data != null) {
            _walletLoading.value = false;
            _wallet.value = data;
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

  void _listTransaction(double? id) async {
    try {
      final response = await _transactionUseCase.listTransaction(id, _listTransactionPage);
      response.when(
          success: (data) {
            if (data != null) {
              final isLastPage = data.length < 15;
              if (isLastPage) {
                pagingController.appendLastPage(data);
              } else {
                _listTransactionPage += 1;
                pagingController.appendPage(data, _listTransactionPage);
              }
            }
          },
          failure: (message) {},
          error: (e) {}
      );
    } catch (e) {
      pagingController.error = e;
    }
  }

  @override
  void onClose() {
    pagingController.dispose();

    super.onClose();
  }

}