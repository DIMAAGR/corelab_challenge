import 'package:corelab_challenge/modules/shared/pages/styles/colors.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  static TextStyle get inferiorMenuTileTitle => const TextStyle(
        fontFamily: 'Circular Std',
        fontWeight: FontWeight.w400,
        fontSize: 9,
      );
  static TextStyle get notFoundTitle => const TextStyle(
        fontFamily: 'Dm Sans',
        fontWeight: FontWeight.w500,
        fontSize: 18,
        color: AppColors.richBlack,
      );
  static TextStyle get notFoundSubtitle => const TextStyle(
        fontFamily: 'Dm Sans',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: AppColors.deepSpaceSparkle,
      );
}
