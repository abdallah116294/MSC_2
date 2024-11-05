import 'package:flutter/material.dart';
import 'package:msc_2/features/auth/sign_in/screen/sign_in_screen.dart';
import 'package:msc_2/features/on_boarding/screen/on_boarding_screen.dart';
import 'package:msc_2/features/splash/screen/splash_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppRoutes {
  static const String splashScreenRoute = "SplashView";
  static const String onBoardingRoute = "OnBoardingView";
  static const String signInRoute = "SignInScreen";
  static Route? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case splashScreenRoute:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case onBoardingRoute:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());
      case signInRoute:
        return MaterialPageRoute(builder: (context)=>const SignInScreen());
      default:
        return null;
    }
  }
}
