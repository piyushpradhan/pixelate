import 'package:blog/core/viewmodels/edit_model.dart';
import 'package:get_it/get_it.dart';

import 'core/viewmodels/home_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory(() => HomeModel());
  locator.registerFactory(() => EditModel());
}
