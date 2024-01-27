import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ex/route/router_delegate_impl.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  RouterDelegateImpl routerDelegateImpl = RouterDelegateImpl();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark, // Android
      statusBarBrightness: Brightness.light // iOS
    ));

    return MaterialApp(
      title: 'Ex',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true
      ),
      home: Router(
        routerDelegate: routerDelegateImpl,
        backButtonDispatcher: RootBackButtonDispatcher(),
      ),
    );
  }

}