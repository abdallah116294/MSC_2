import 'package:flutter/material.dart';
import 'package:msc_2/app_config.dart';
import 'package:msc_2/features/app/my_app.dart';

void main() {
  var appDevConfig = const AppConfig(
      appTitle: "MSC Development", apiBaseUrl: 'apiBaseUrl', child: MyApp());
  runApp(appDevConfig);
}
