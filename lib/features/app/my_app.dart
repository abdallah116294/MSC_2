import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:msc_2/app_config.dart';
import 'package:msc_2/config/routes/app_routes.dart';
import 'package:msc_2/core/localization/app_localization_setup.dart';
import 'package:msc_2/features/app/cubit/app_cubit.dart';
import 'package:msc_2/features/splash/screen/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    var appConfig = AppConfig.of(context);
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return BlocProvider(
          create: (context) => AppCubit(),
          child: BlocBuilder<AppCubit, AppState>(
            builder: (context, state) {
              if(state is SelectedLocale){
                return MaterialApp(
                  title: appConfig!.appTitle,
                  locale: state.locale,
                  supportedLocales: AppLocalizationsSetup.supportedLocales,
                  localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
                  localeResolutionCallback: AppLocalizationsSetup.localeResolutionCallback,
                  onGenerateRoute: AppRoutes.onGenerateRoute,
                  navigatorKey: navigatorKey,
                  debugShowCheckedModeBanner:
                      appConfig.appTitle == "MSC Development" ? true : false,
                  home: child);
              }
              return Container();
            },
          ),
        );
      },
      child: const SplashScreen(),
    );
  }
}
