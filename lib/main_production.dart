import 'package:flutter/material.dart';
import 'package:msc_2/app_config.dart';
import 'package:msc_2/features/app/my_app.dart';

void main() {
  var appProConfig =const  AppConfig(appTitle: "MSC", apiBaseUrl: "", child: MyApp());
  runApp(appProConfig);
}
