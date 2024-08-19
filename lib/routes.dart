import 'package:flutter/material.dart';
import 'package:flutter_chess/ui/screen/home/home_screen.dart';
import 'package:flutter_chess/ui/screen/standard/standard_screen.dart';
class FadeRoute extends PageRouteBuilder {
  FadeRoute({required this.page})
      : super(
    pageBuilder: (_, __, ___) => page,
    transitionsBuilder: (_, animation, __, child) => FadeTransition(
      opacity: animation,
      child: child,
    ),
  );

  final Widget page;
}
enum Routes {
  home,
  standard
}

class _Paths {
  static const String home = 'home';
  static const String standard = 'standard';

  static const Map<Routes, String> _pathMap = {
    Routes.home: _Paths.home,
    Routes.standard: _Paths.standard
  };

  static String of(Routes route) => _pathMap[route] ?? home;
}

class AppNavigator {
    static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

    static Route onGenerateRoute(RouteSettings settings){
          print("generate Route settings name ${settings.name}");

          switch(settings.name){
            case _Paths.standard:
              return FadeRoute(page: const StandardScreen());
            default:
              return FadeRoute(page: const HomeScreen());
          }
    }
    static Future? push<T>(Routes route, [T? arguments]) =>
        state?.pushNamed(_Paths.of(route), arguments: arguments);

    static Future? replaceWith<T>(Routes route, [T? arguments]) =>
        state?.pushReplacementNamed(_Paths.of(route), arguments: arguments);

    static void pop() => state?.pop();

    static NavigatorState? get state => navigatorKey.currentState;
}

