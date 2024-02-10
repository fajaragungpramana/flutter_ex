import 'package:flutter_ex/core/app/app_response.dart';
import 'package:flutter_ex/core/data/remote/transaction/response/transaction_response.dart';

abstract class TransactionRepository {
  Future<AppResponse<List<TransactionResponse>>> listTransaction(double? id, int page);
}