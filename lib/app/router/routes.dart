

import 'package:auto_route/auto_route_annotations.dart';
import 'package:taskio/ui/views/home/home_view.dart';
import 'package:taskio/ui/views/login/login_view.dart';
import 'package:taskio/ui/views/signup/signup_view.dart';
import 'package:taskio/ui/views/tasks/create_task_view.dart';
import 'package:taskio/ui/views/splash_screen/splashScreen_view.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
MaterialRoute(page: LoginView),
MaterialRoute(page: SignupView),
MaterialRoute(page: HomeView),
MaterialRoute(page: CreateTaskView),
MaterialRoute(page: SplashScreenView)
])

class $Router{}

//flutter packages pub run build_runner build --delete-conflicting-outputs