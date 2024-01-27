import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashController extends GetxController {

  final RxString _appName = "".obs;
  String get appName => _appName.value;

  final RxString _appVersion = "".obs;
  String get appVersion => _appVersion.value;

  @override
  void onInit() {
    _getPackageInfo();
  }

  Future<void> _getPackageInfo() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();

    _appName.value = packageInfo.appName;
    _appVersion.value = packageInfo.version;
  }

}