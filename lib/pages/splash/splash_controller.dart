import 'package:flutter_ex/core/domain/auth/auth_use_case.dart';
import 'package:flutter_ex/routes/app_route.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashController extends GetxController {
  final AuthUseCase _authUseCase;

  SplashController(this._authUseCase);

  final _appName = "".obs;
  get appName => _appName.value;

  final _appVersion = "".obs;
  get appVersion => _appVersion.value;

  @override
  void onInit() {
    _getPackageInfo();
    _setDelay(3);

    super.onInit();
  }

  _getPackageInfo() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();

    _appName.value = packageInfo.appName;
    _appVersion.value = packageInfo.version;
  }

  _setDelay(int seconds) async {
    final auth = await _authUseCase.auth;

    await Future.delayed(Duration(seconds: seconds), () {
      Get.offAndToNamed(auth.isLogin == true ? AppRoute.main : AppRoute.login);
    });
  }

}