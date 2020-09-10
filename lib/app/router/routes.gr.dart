// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../ui/views/home/home_view.dart';
import '../../ui/views/login/login_view.dart';
import '../../ui/views/signup/signup_view.dart';
import '../../ui/views/splash_screen/splashScreen_view.dart';
import '../../ui/views/tasks/create_task_view.dart';

class Routes {
  static const String loginView = '/login-view';
  static const String signupView = '/signup-view';
  static const String homeView = '/home-view';
  static const String createTaskView = '/create-task-view';
  static const String splashScreenView = '/splash-screen-view';
  static const all = <String>{
    loginView,
    signupView,
    homeView,
    createTaskView,
    splashScreenView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.signupView, page: SignupView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.createTaskView, page: CreateTaskView),
    RouteDef(Routes.splashScreenView, page: SplashScreenView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginView(),
        settings: data,
      );
    },
    SignupView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignupView(),
        settings: data,
      );
    },
    HomeView: (data) {
      final args = data.getArgs<HomeViewArguments>(
        orElse: () => HomeViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeView(userId: args.userId),
        settings: data,
      );
    },
    CreateTaskView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => CreateTaskView(),
        settings: data,
      );
    },
    SplashScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SplashScreenView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// HomeView arguments holder class
class HomeViewArguments {
  final String userId;
  HomeViewArguments({this.userId});
}
