// Package imports:
import 'package:flutter_cashrich/services/Repository/home_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

// Project imports:
import './view_model/splash_view_model.dart';
import './view_model/home_view_model.dart';
final locator = GetIt.instance;

Future setUpServiceLocator() async {
  locator.registerFactory(() => SplashViewModel());
  locator.registerFactory(() => HomeViewModel());
  locator.registerFactory(() => HomeRepository());

  locator.registerLazySingleton<Logger>(() => Logger(printer: PrettyPrinter()));
}