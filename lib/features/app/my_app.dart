import 'package:flutter/material.dart';
import 'package:msc_2/app_config.dart';
import 'package:msc_2/features/splash/screen/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var appConfig = AppConfig.of(context);
    return MaterialApp(
        title:appConfig!.appTitle,
        debugShowCheckedModeBanner: appConfig.appTitle=="MSC Development"?true:false,
        home: const SplashScreen());
  }
}
