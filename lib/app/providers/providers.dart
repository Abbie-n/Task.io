import 'package:provider/provider.dart';
import 'package:taskio/ui/views/home/home_viewmodel.dart';
import 'package:taskio/ui/views/login/login_viewmodel.dart';
import 'package:taskio/ui/views/signup/signup_viewmodel.dart';
import 'package:taskio/ui/views/tasks/create_task_viewmodel.dart';
import 'package:taskio/ui/views/splash_screen/splashScreen_viewmodel.dart';

final providers = <SingleChildCloneableWidget>[
  ChangeNotifierProvider(create: (_) => LoginViewModel()),
  ChangeNotifierProvider(create: (_) => SignupViewModel()),
  ChangeNotifierProvider(create: (_) => HomeViewModel()),
  ChangeNotifierProvider(create: (_) => CreateTaskViewModel()),
  ChangeNotifierProvider(create: (_) => SplashScreenViewModel())

];
