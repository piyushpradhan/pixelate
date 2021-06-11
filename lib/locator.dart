import 'package:blog/core/services/api.dart';
import 'package:blog/core/viewmodels/edit_model.dart';
import 'package:get_it/get_it.dart';

import 'core/services/authentication.dart';
import 'core/viewmodels/home_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => AuthenticationService());

  locator.registerFactory(() => HomeModel());
  locator.registerFactory(() => EditModel());
}