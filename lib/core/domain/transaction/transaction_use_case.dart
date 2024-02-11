import 'package:flutter_ex/core/app/app_response.dart';
import 'package:flutter_ex/core/data/remote/transaction/request/transaction_request.dart';
import 'package:flutter_ex/core/domain/transaction/model/transaction.dart';

abstract class TransactionUseCase {

  Future<AppResponse<List<Transaction>>> listTransaction(double? id, int page);

  Future<AppResponse<Transaction>> setTransaction(TransactionRequest transactionRequest);

}