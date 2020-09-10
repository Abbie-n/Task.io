import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:taskio/core/services/auth.dart';

final GetIt locator = GetIt.instance;

// ignore: missing_return
Future<void> setupLocator() {

  locator.registerLazySingleton(() => FirebaseAuth.instance);

  locator.registerLazySingleton(() => Firestore.instance);

  locator.registerLazySingleton<AuthServiceImpl>(() => AuthServiceImpl());
}
