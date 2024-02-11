import 'package:flutter_ex/core/app/app_response.dart';
import 'package:flutter_ex/core/data/remote/user/request/wallet_request.dart';
import 'package:flutter_ex/core/data/remote/user/user_repository.dart';
import 'package:flutter_ex/core/domain/user/model/user.dart';
import 'package:flutter_ex/core/domain/user/model/wallet.dart';
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
  Future<AppResponse<List<Wallet>>> listWallet() async {
    final response = await _userRepository.listWallet();
    return response.when(
        success: (data) {
          return AppResponse.success(data: Wallet.mapToList(data));
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
  Future<AppResponse<Wallet>> setWallet(WalletRequest walletRequest) async {
    final response = await _userRepository.setWallet(walletRequest);
    return response.when(
        success: (data) {
          return AppResponse.success(data: Wallet.mapToObject(data));
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
  Future<AppResponse<Wallet>> getWallet(double? id) async {
    final response = await _userRepository.getWallet(id);
    return response.when(
        success: (data) {
          return AppResponse.success(data: Wallet.mapToObject(data));
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