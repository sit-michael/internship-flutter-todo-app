import 'package:flutter/material.dart';

import 'core/app/app.dart';
import 'core/services/custom_bloc_observer.dart';
import 'core/services/dependency_injection.dart';
import 'domain/bloc_exports.dart';

void main() async {
  await _initApp();

  runApp(const MyApp());
}

Future<void> _initApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();

  Bloc.observer = CustomBlocObserver();
}
