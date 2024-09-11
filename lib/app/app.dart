import 'package:flutter/material.dart';
import 'package:udemy_mvvm_seriese/presentation/recources/routs.dart';
import 'package:udemy_mvvm_seriese/presentation/recources/theme_manager.dart';

class MyApp extends StatefulWidget {

   MyApp._internal();  // private named Constructor

   int appState = 0;

  static final MyApp instance = MyApp._internal();  // single instance -- singelton

  factory MyApp() => instance;  // factory for class instance


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routs.splashRoute,
      theme: getApplicationTheme(),
    );
  }
}
