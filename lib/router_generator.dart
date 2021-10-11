import 'package:flutter/material.dart';
import 'package:meemus_delivery_service/screens/authentication/login_screen.dart';
import 'package:meemus_delivery_service/screens/authentication/signup_screen.dart';
import 'package:meemus_delivery_service/screens/home_screen.dart';
import 'package:meemus_delivery_service/screens/splash_screen.dart';

const String initialRoute = '/';
const String loginRoute = '/login';
const String signupRoute = '/signup';
const String homeRoute = '/home';

class RouteGenerator {
  static Route<dynamic> onGeneratedRoutes(RouteSettings settings) {
    late dynamic args;
    if (settings.arguments != null) {
      args = settings.arguments as Map;
    }
    switch (settings.name) {
      case initialRoute:
        return _getPageRoute(const SplashScreen());

      case loginRoute:
        return _getPageRoute(LoginScreen());

      case signupRoute:
        return _getPageRoute(SignupScreen());

      case homeRoute:
        return _getPageRoute(const HomeScreen());

      default:
        return _errorRoute();
    }
  }

  static PageRoute _getPageRoute(Widget child) {
    return MaterialPageRoute(builder: (ctx) => child);
  }

  static PageRoute _errorRoute() {
    return MaterialPageRoute(builder: (ctx) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('404'),
        ),
        body: const Center(
          child: Text('ERROR 404: Not Found'),
        ),
      );
    });
  }
}
