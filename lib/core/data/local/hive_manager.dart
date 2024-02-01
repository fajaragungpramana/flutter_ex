import 'package:flutter_ex/constant/app_constant.dart';
import 'package:hive/hive.dart';

class HiveManager {

  final String _accessToken = "access_token";
  final String _refreshToken = "refresh_token";

  late Box<dynamic> _box;

  HiveManager() {
    _box = Hive.box(AppConstant.hiveBoxCacheDatabase);
  }

  String? get accessToken => _box.get(_accessToken);
  set setAccessToken(String accessToken) => _box.put(_accessToken, accessToken);

  String? get refreshToken => _box.get(_refreshToken);
  set setRefreshToken(String refreshToken) => _box.put(_refreshToken, refreshToken);

}