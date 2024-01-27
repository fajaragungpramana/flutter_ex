import 'package:flutter_ex/pages/login/login_binding.dart';
import 'package:flutter_ex/pages/login/login_page.dart';
import 'package:flutter_ex/routes/app_route.dart';
import 'package:flutter_ex/pages/splash/splash_binding.dart';
import 'package:flutter_ex/pages/splash/splash_page.dart';
import 'package:get/get.dart';

class AppPage {
  const AppPage._();

  static const splash = AppRoute.splash;

  static final listRoute = [
    GetPage(
        name: AppRoute.splash,
        page: () => SplashPage(),
        binding: SplashBinding(),
        transition: Transition.leftToRight),
    GetPage(
        name: AppRoute.login,
        page: () => LoginPage(),
        binding: LoginBinding(),
        transition: Transition.leftToRight)
  ];
}
