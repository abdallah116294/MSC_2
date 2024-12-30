import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msc_2/features/auth/sign_in/cubit/sign_in_cubit.dart';
import 'package:msc_2/features/auth/sign_in/screen/sign_in_screen.dart';
import 'package:msc_2/features/on_boarding/screen/on_boarding_screen.dart';
import 'package:msc_2/features/splash/screen/splash_screen.dart';
import 'package:msc_2/features/subscription/cubit/subscription_cubit.dart';
import 'package:msc_2/features/subscription/screen/sunscription_screen.dart';
import 'package:msc_2/injection_container.dart' as di;

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppRoutes {
  static const String splashScreenRoute = "SplashView";
  static const String onBoardingRoute = "OnBoardingView";
  static const String signInRoute = "SignInScreen";
  static const String subscriptionRoute = "SubscriptionScreen";
  static BuildContext currentContext = navigatorKey.currentContext!;
  static Route? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case splashScreenRoute:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case onBoardingRoute:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());
      case signInRoute:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => di.sl<SignInCubit>(),
                  child: const SignInScreen(),
                ));
      case subscriptionRoute:
        return MaterialPageRoute(builder: (context) => SubscriptionView());
      default:
        return null;
    }
  }
}
