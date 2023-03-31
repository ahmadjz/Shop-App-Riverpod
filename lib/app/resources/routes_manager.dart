import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_app_riverpod/views/auth/auth_page.dart';
import 'package:shop_app_riverpod/views/home/home_page.dart';
import 'package:shop_app_riverpod/views/landing/landing_page.dart';
import 'package:shop_app_riverpod/views/not_found.dart';

class AppRoutes {
  static const String landingPageRoute = "/";
  static const String authPageRoute = "/auth";
  static const String homePageRoute = "/home";
}

class AppRouter {
  static final FluroRouter router = FluroRouter();

  static void setupRouter() {
    router.define(
      AppRoutes.authPageRoute,
      handler: Handler(
          handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
              AuthPage()),
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      AppRoutes.landingPageRoute,
      handler: Handler(
          handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
              const LandingPage()),
      transitionType: TransitionType.fadeIn,
    );

    router.define(
      AppRoutes.homePageRoute,
      handler: Handler(
          handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
              const HomePage()),
      transitionType: TransitionType.fadeIn,
    );

    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          const NotFoundPage(),
    );
  }
}
