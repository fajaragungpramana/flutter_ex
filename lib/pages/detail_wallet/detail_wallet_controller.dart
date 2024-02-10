import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ex/core/data/remote/transaction/response/transaction_response.dart';
import 'package:flutter_ex/core/data/remote/user/response/wallet_response.dart';
import 'package:flutter_ex/core/domain/transaction/transaction_use_case.dart';
import 'package:flutter_ex/core/domain/user/user_use_case.dart';
import 'package:flutter_ex/pages/detail_wallet/detail_wallet_event.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class DetailWalletController extends GetxController {
  final EventBus _eventBus;
  final UserUseCase _userUseCase;
  final TransactionUseCase _transactionUseCase;

  DetailWalletController(this._eventBus, this._userUseCase, this._transactionUseCase);

  final PagingController<int, TransactionResponse> pagingController = PagingController(firstPageKey: 1);

  final _walletLoading = true.obs;
  get walletLoading => _walletLoading.value;

  final Rx<WalletResponse> _walletResponse = const WalletResponse().obs;
  WalletResponse get walletResponse => _walletResponse.value;

  @override
  void onInit() async {
    final id = Get.arguments["id"];
    _getWallet(id);
    pagingController.addPageRequestListener((pageKey) {
      _listTransaction(id, pageKey);
    });

    _eventBus.on<DetailWalletEvent>().listen((event) {
      if (event == DetailWalletEvent.refresh) {
        _getWallet(id);
        pagingController.refresh();
      }
    });

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

  void _listTransaction(double? id, int page) async {
    try {
      final response = await _transactionUseCase.listTransaction(id, page);
      response.when(
          success: (data) {
            if (data != null) {
              final isLastPage = data.length < 15;
              if (isLastPage) {
                pagingController.appendLastPage(data);
              } else {
                final nextPage = page + data.length;
                pagingController.appendPage(data, nextPage);
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