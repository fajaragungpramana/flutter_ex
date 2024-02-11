import 'package:flutter_ex/core/app/app_response.dart';
import 'package:flutter_ex/core/data/remote/user/request/wallet_request.dart';
import 'package:flutter_ex/core/data/remote/user/response/wallet_response.dart';
import 'package:flutter_ex/core/data/remote/user/user_repository.dart';
import 'package:flutter_ex/core/domain/user/model/user.dart';
import 'package:flutter_ex/core/domain/user/user_use_case.dart';

class UserInteractor implements UserUseCase {
  final UserRepository _userRepository;

  UserInteractor(this._userRepository);

  @override
  Future<AppResponse<User>> me() async {
    final response = await _userRepository.me();
    return response.when(
        success: (data) {
          return AppResponse.success(data: User.mapToObject(data));
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
  Future<AppResponse<List<WalletResponse>>> listWallet() async =>
      await _userRepository.listWallet();

  @override
  Future<AppResponse<WalletResponse>> setWallet(WalletRequest walletRequest) async =>
      await _userRepository.setWallet(walletRequest);

  @override
  Future<AppResponse<WalletResponse>> getWallet(double? id) async =>
      await _userRepository.getWallet(id);

}