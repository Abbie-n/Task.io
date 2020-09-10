

import 'package:auto_route/auto_route_annotations.dart';
import 'package:taskio/ui/views/home/home_view.dart';
import 'package:taskio/ui/views/login/login_view.dart';
import 'package:taskio/ui/views/signup/signup_view.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
MaterialRoute(page: LoginView),
MaterialRoute(page: SignupView),
MaterialRoute(page: HomeView)
])

class $Router{}

//flutter packages pub run build_runner build --delete-conflicting-outputs