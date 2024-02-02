import 'package:flutter_ex/core/app/app_response.dart';
import 'package:flutter_ex/core/data/remote/user/response/user_response.dart';
import 'package:flutter_ex/core/data/remote/user/user_repository.dart';
import 'package:flutter_ex/core/domain/user/user_use_case.dart';

class UserInteractor implements UserUseCase {
  final UserRepository _userRepository;

  UserInteractor(this._userRepository);

  @override
  Future<AppResponse<UserResponse>> me() async => _userRepository.me();

}