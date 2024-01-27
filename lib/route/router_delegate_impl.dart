import 'package:flutter/material.dart';
import 'package:flutter_ex/constant/page_constant.dart';
import 'package:flutter_ex/ui/splash/splash_page.dart';

class RouterDelegateImpl extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {

  final GlobalKey<NavigatorState> _navigatorKey;

  RouterDelegateImpl() : _navigatorKey  = GlobalKey<NavigatorState>();

  List<Page> pageStack = [];

  @override
  Widget build(BuildContext context) {
    pageStack.add(
        const MaterialPage(child: SplashPage(), key: ValueKey(PageConstant.splashPage))
    );

    return Navigator(
      key: _navigatorKey,
      pages: pageStack,
      onPopPage: (route, result) {
        final didPop = route.didPop(result);
        if (!didPop) {
          return false;
        }

        notifyListeners();

        return true;
      },
    );
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  @override
  Future<void> setNewRoutePath(configuration) async {}

}
