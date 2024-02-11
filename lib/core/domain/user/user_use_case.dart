import 'package:flutter_ex/core/app/app_response.dart';
import 'package:flutter_ex/core/data/remote/user/request/wallet_request.dart';
import 'package:flutter_ex/core/domain/user/model/user.dart';
import 'package:flutter_ex/core/domain/user/model/wallet.dart';

abstract class UserUseCase {

  Future<AppResponse<User>> me();

  Future<AppResponse<List<Wallet>>> listWallet();

  Future<AppResponse<Wallet>> setWallet(WalletRequest walletRequest);

  Future<AppResponse<Wallet>> getWallet(double? id);

}