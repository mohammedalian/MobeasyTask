import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobeasytask/presentation/resources/app_routes.dart';
import '../bloc/contest_bloc.dart';
import '../presentation/resources/app_strings.dart';


class MyApp extends StatelessWidget {
  const MyApp._();

  static const MyApp _instance = MyApp._();

  factory MyApp() => _instance;


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContestBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings.appName,
        initialRoute:AppRoutes().initRoute(),
        routes: AppRoutes().appRoute(),
      ),
    );
  }
}
