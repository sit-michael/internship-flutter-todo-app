import 'package:flutter/material.dart';

import '../../domain/bloc_exports.dart';
import '../../presentation/splash/splash_screen.dart';
import '../services/dependency_injection.dart';
import 'router/app_router.dart';
import 'themes/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(locator()),
      child: MaterialApp(
        title: 'Todo',
        theme: AppTheme.getDefaultTheme(),
        onGenerateRoute: AppRouter().onGenerateRoute,
        initialRoute: SplashScreen.id,
      ),
    );
  }
}
