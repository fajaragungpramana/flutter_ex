import 'package:flutter_ex/core/app/app_response.dart';
import 'package:flutter_ex/core/data/remote/user/request/wallet_request.dart';
import 'package:flutter_ex/core/data/remote/user/response/user_response.dart';
import 'package:flutter_ex/core/data/remote/user/response/wallet_response.dart';

abstract class UserRepository {

  Future<AppResponse<UserResponse>> me();

  Future<AppResponse<List<WalletResponse>>> listWallet();

  Future<AppResponse<WalletResponse>> setWallet(WalletRequest walletRequest);

}