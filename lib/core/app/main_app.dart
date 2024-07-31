import 'package:corelab_challenge/modules/shared/pages/styles/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      title: 'Corelab Challenge',
      theme: AppThemeData.theme,
      themeMode: ThemeMode.light,
    );
  }
}
