import 'package:flutter_ex/core/data/remote/user/response/user_response.dart';

class User {
  final String? fullName;
  final String? email;

  User({
    this.fullName,
    this.email
  });

  static skeleton() => User(
      fullName: "**************",
      email: "****************************"
  );

  static mapToObject(UserResponse? userResponse) => User(
      fullName: userResponse?.fullName,
      email: userResponse?.email
  );
}