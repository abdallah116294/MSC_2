import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msc_2/app_config.dart';
import 'package:msc_2/core/cache/cache_helper.dart';
import 'package:msc_2/features/app/cubit/bloc_observer.dart';
import 'package:msc_2/features/app/my_app.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
   Bloc.observer = AppBlocObserver();
  var appDevConfig = const AppConfig(
      appTitle: "MSC Development", apiBaseUrl: 'apiBaseUrl', child: MyApp());
  runApp(appDevConfig);
}
