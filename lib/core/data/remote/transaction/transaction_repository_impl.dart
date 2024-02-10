import 'package:flutter_ex/core/app/app_response.dart';
import 'package:flutter_ex/core/data/remote/transaction/response/transaction_response.dart';
import 'package:flutter_ex/core/data/remote/transaction/transaction_repository.dart';
import 'package:flutter_ex/core/data/remote/transaction/transaction_service.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionService _transactionService;

  TransactionRepositoryImpl(this._transactionService);

  @override
  Future<AppResponse<List<TransactionResponse>>> listTransaction(double? id, int page) async =>
      await _transactionService.listTransaction(id: id, page: page);

}