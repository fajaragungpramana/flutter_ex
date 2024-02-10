import 'package:flutter_ex/core/app/app_response.dart';
import 'package:flutter_ex/core/data/remote/transaction/response/transaction_response.dart';
import 'package:flutter_ex/core/data/remote/transaction/transaction_repository.dart';
import 'package:flutter_ex/core/domain/transaction/transaction_use_case.dart';

class TransactionInteractor implements TransactionUseCase {
  final TransactionRepository _transactionRepository;

  TransactionInteractor(this._transactionRepository);

  @override
  Future<AppResponse<List<TransactionResponse>>> listTransaction(double? id, int page) async =>
      await _transactionRepository.listTransaction(id, page);

}