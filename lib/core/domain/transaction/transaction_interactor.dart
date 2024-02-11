import 'package:flutter_ex/core/app/app_response.dart';
import 'package:flutter_ex/core/data/remote/transaction/request/transaction_request.dart';
import 'package:flutter_ex/core/data/remote/transaction/transaction_repository.dart';
import 'package:flutter_ex/core/domain/transaction/model/transaction.dart';
import 'package:flutter_ex/core/domain/transaction/transaction_use_case.dart';

class TransactionInteractor implements TransactionUseCase {
  final TransactionRepository _transactionRepository;

  TransactionInteractor(this._transactionRepository);

  @override
  Future<AppResponse<List<Transaction>>> listTransaction(double? id, int page) async {
    final response = await _transactionRepository.listTransaction(id, page);
    return response.when(
        success: (data) {
          return AppResponse.success(data: Transaction.mapToList(data));
        },
        failure: (message) {
          return AppResponse.failure(message: message);
        },
        error: (e) {
          return AppResponse.error(exception: e);
        }
    );
  }

  @override
  Future<AppResponse<Transaction>> setTransaction(TransactionRequest transactionRequest) async {
    final response = await _transactionRepository.setTransaction(transactionRequest);
    return response.when(
        success: (data) {
          return AppResponse.success(data: Transaction.mapToObject(data));
        },
        failure: (message) {
          return AppResponse.failure(message: message);
        },
        error: (e) {
          return AppResponse.error(exception: e);
        }
    );
  }

}