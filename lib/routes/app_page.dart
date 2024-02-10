import 'package:flutter_ex/pages/add_wallet/add_wallet_binding.dart';
import 'package:flutter_ex/pages/add_wallet/add_wallet_page.dart';
import 'package:flutter_ex/pages/detail_wallet/detail_wallet_binding.dart';
import 'package:flutter_ex/pages/detail_wallet/detail_wallet_page.dart';
import 'package:flutter_ex/pages/login/login_binding.dart';
import 'package:flutter_ex/pages/login/login_page.dart';
import 'package:flutter_ex/pages/main/main_binding.dart';
import 'package:flutter_ex/pages/main/main_page.dart';
import 'package:flutter_ex/pages/register/register_binding.dart';
import 'package:flutter_ex/pages/register/register_page.dart';
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
        page: () => const SplashPage(),
        binding: SplashBinding()),
    GetPage(
        name: AppRoute.login,
        page: () => const LoginPage(),
        binding: LoginBinding()),
    GetPage(
        name: AppRoute.register,
        page: () => const RegisterPage(),
        binding: RegisterBinding()),
    GetPage(
        name: AppRoute.main,
        page: () => const MainPage(),
        binding: MainBinding()),
    GetPage(
        name: AppRoute.addWallet,
        page: () => const AddWalletPage(),
        binding: AddWalletBinding()),
    GetPage(
        name: AppRoute.detailWallet,
        page: () => const DetailWalletPage(),
        binding: DetailWalletBinding())
  ];
}
