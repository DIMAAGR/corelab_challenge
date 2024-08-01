import 'package:corelab_challenge/modules/shared/pages/styles/colors.dart';
import 'package:flutter/material.dart';

class AppThemeData {
  static get theme => ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: const AppBarTheme(color: AppColors.primary, elevation: 0),
      );
}
