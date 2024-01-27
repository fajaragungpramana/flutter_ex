import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ex/route/app_page.dart';
import 'package:get/get.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark, // Android
        statusBarBrightness: Brightness.light // iOS
        ));

    return GetMaterialApp(
      title: 'EX',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true),
      getPages: AppPage.listRoute,
      initialRoute: AppPage.splash,
    );
  }
}
