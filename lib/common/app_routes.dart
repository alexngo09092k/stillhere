import 'package:flutter/material.dart';
import 'package:still_here/features/home/presentation/home_page.dart';
import 'package:still_here/features/splash/splash_page.dart';
import 'package:still_here/features/premium/presentation/premium_page.dart';

abstract class IAppRoutes {
  String get initialRoute;

  Map<String, Widget Function(BuildContext)> get routes;

  Route<dynamic>? onGenerateRoute(RouteSettings settings);

  Route<dynamic>? buildRoute(Widget page, RouteSettings settings);
}

class AppRoutes extends IAppRoutes {
  factory AppRoutes() => _instance as AppRoutes;

  AppRoutes._internal();

  static const String premiumPage = 'premium_page';
  static const String homePage = 'home_page';
  static const String splashPage = 'splash_page';

  static final IAppRoutes _instance = AppRoutes._internal();

  @override
  Map<String, Widget Function(BuildContext)> routes = {
    homePage: (_) => const HomePage(),
    premiumPage: (_) => const PremiumPage(),
  };

  @override
  buildRoute(Widget page, RouteSettings settings) {
    return MaterialPageRoute(builder: (content) => page, settings: settings);
  }

  @override
  String get initialRoute => splashPage;

  @override
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashPage:
        return buildRoute(const SplashPage(), settings);
      case homePage:
        return buildRoute(const HomePage(), settings);
      case premiumPage:
        return buildRoute(const PremiumPage(), settings);
      default:
        throw ErrorDescription("Not found page");
    }
  }

  static IAppRoutes get instance => _instance;
}
