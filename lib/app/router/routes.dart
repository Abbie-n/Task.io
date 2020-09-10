

import 'package:auto_route/auto_route_annotations.dart';
import 'package:taskio/ui/views/home/home_view.dart';
import 'package:taskio/ui/views/login/login_view.dart';
import 'package:taskio/ui/views/signup/signup_view.dart';
import 'package:taskio/ui/views/tasks/create_task.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
MaterialRoute(page: LoginView),
MaterialRoute(page: SignupView),
MaterialRoute(page: HomeView),
MaterialRoute(page: CreateTaskView)
])

class $Router{}

//flutter packages pub run build_runner build --delete-conflicting-outputs