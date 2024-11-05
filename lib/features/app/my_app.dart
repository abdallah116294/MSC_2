import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:msc_2/app_config.dart';
import 'package:msc_2/config/routes/app_routes.dart';
import 'package:msc_2/features/splash/screen/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    var appConfig = AppConfig.of(context);
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
            title: appConfig!.appTitle,
            onGenerateRoute: AppRoutes.onGenerateRoute,
            debugShowCheckedModeBanner:
                appConfig.appTitle == "MSC Development" ? true : false,
            home: child);
      },
      child: const SplashScreen(),
    );
  }
}
