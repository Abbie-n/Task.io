import 'package:get_it/get_it.dart';
import 'package:taskio/core/services/auth.dart';
//import 'package:stacked_services/stacked_services.dart';

final GetIt locator = GetIt.instance;

// ignore: missing_return
Future<void> setupLocator() {
  //locator.registerLazySingleton(() => NavigationService());

  locator.registerLazySingleton<AuthService>(() => AuthServiceImpl());
}
