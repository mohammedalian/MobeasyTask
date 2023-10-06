import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobeasytask/presentation/pages/contest_page.dart';
import 'package:mobeasytask/presentation/pages/home_page.dart';
import 'package:mobeasytask/presentation/pages/leaderboard_page.dart';
import 'package:mobeasytask/presentation/pages/result_page.dart';
import 'package:mobeasytask/presentation/resources/app_strings.dart';
import 'package:mobeasytask/utils/constans.dart';
User? user = authInstance.currentUser;

class AppRoutes {
  Map<String, Widget Function(BuildContext)> appRoute() {
    return {
      AppStrings.homePage: (context) => const HomePage(),
      AppStrings.contestPage: (context) => ContestPage(),
      AppStrings.resultPage: (context) => const ResultPage(),
      AppStrings.leaderBoardPage: (context) => const LeaderBoardPage(),
    };
  }


  String initRoute(){
  return user == null ? AppStrings.homePage : AppStrings.contestPage;
}
}
