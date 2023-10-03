import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';

import 'app/app_widget.dart';
import 'app/common/dependency/dependency_injection.dart';

main() async {
  GetIt getIt = GetIt.instance;
  final appInjection = AppInjection();
  appInjection.call(getIt);
  runApp(const AppWidget());
}
