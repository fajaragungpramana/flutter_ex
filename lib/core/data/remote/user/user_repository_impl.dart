import 'package:flutter_ex/core/app/app_response.dart';
import 'package:flutter_ex/core/data/remote/user/request/wallet_request.dart';
import 'package:flutter_ex/core/data/remote/user/response/user_response.dart';
import 'package:flutter_ex/core/data/remote/user/response/wallet_response.dart';
import 'package:flutter_ex/core/data/remote/user/user_repository.dart';
import 'package:flutter_ex/core/data/remote/user/user_service.dart';

class UserRepositoryImpl implements UserRepository {
  final UserService _userService;

  UserRepositoryImpl(this._userService);

  @override
  Future<AppResponse<UserResponse>> me() async =>
      await _userService.me();

  @override
  Future<AppResponse<List<WalletResponse>>> listWallet() async =>
      await _userService.listWallet();

  @override
  Future<AppResponse<WalletResponse>> setWallet(WalletRequest walletRequest) async =>
      await _userService.setWallet(walletRequest);

  @override
  Future<AppResponse<WalletResponse>> getWallet(double? id) async =>
      await _userService.getWallet(id);

}