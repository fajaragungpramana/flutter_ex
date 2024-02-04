import 'package:flutter_ex/core/app/app_response.dart';
import 'package:flutter_ex/core/data/remote/user/response/user_response.dart';

abstract class UserUseCase {

  Future<AppResponse<UserResponse>> me();

}