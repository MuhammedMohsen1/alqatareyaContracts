import 'dart:io';

import 'package:alqatareyacontracts/features/create_contract/presentation/views/create_contract.dart';
import 'package:alqatareyacontracts/features/dashboard/presentation/view/dashboard_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/auth_feature/login_view.dart';
import '../../features/splash_feature/splash_screen.dart';

import 'routes.dart';

class AppRouter {
  AppRouter();

  final navigatorKey = GlobalKey<NavigatorState>();

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return _getPageRoute(
          const SplashScreen(),
        );

      case Routes.login:
        return _getPageRoute(const LoginView());
      case Routes.dashboard:
        return _getPageRoute(const DashboardView()); 
      case Routes.createContract:
        return _getPageRoute(const CreateContract());
    }
    return null;
  }

  PageRoute _getPageRoute(Widget child) {
    if (Platform.isIOS) {
      return CupertinoPageRoute(
        builder: (context) => child,
      );
    } else {
      return CustomPageRouter(child);
    }
  }
}

class CustomPageRouter<T> extends PageRouteBuilder<T> {
  final Widget child;

  CustomPageRouter(this.child)
      : super(
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) =>
                child,
            transitionDuration: const Duration(milliseconds: 300),
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) {
              const begin = 0.0;
              const end = 1.0;
              var tween = Tween<double>(begin: begin, end: end);
              return FadeTransition(
                opacity: animation.drive(tween),
                child: child,
              );
            });
}
