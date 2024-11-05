import 'dart:async';

import 'package:flutter/material.dart';
import 'package:msc_2/app_config.dart';
import 'package:msc_2/config/routes/app_routes.dart';
import 'package:msc_2/core/cache/cache_helper.dart';
import 'package:msc_2/core/extensions/context_extensions.dart';
import 'package:msc_2/core/utils/app_color.dart';
import 'package:msc_2/core/utils/assets_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _gotNext();
  }

  _gotNext() async {
    bool isFirstTime = CacheHelper.getIfFirstTime();
    Future.delayed(const Duration(seconds: 5), () {
      if (isFirstTime) {
        context.pushReplacementNamed(AppRoutes.onBoardingRoute);
      } else {
        //!Sign In view
        context.pushName(AppRoutes.signInRoute);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var appConfig = AppConfig.of(context);
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset(AssetsHelper.splash)),
        ],
      ),
    );
  }
}
