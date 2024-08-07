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
  static TextStyle get category => const TextStyle(
        fontFamily: 'Dm Sans',
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: AppColors.primary,
      );
  static TextStyle get historic => const TextStyle(
        fontFamily: 'Dm Sans',
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: AppColors.grey,
      );
  static TextStyle get appbar => const TextStyle(
        fontFamily: 'Dm Sans',
        fontWeight: FontWeight.w400,
        fontSize: 20,
        color: AppColors.richBlack,
      );

  static TextStyle get appbarSearcherField => const TextStyle(
        fontFamily: 'Dm Sans',
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: AppColors.cadetGrey,
      );

  static TextStyle get historyTileTitle => const TextStyle(
        fontFamily: 'Dm Sans',
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: AppColors.grey,
      );

  static TextStyle get recentlySearches => const TextStyle(
        fontFamily: 'Dm Sans',
        fontWeight: FontWeight.w600,
        fontSize: 13,
        color: AppColors.richBlack,
      );

  static TextStyle get productTitle => const TextStyle(
        fontFamily: 'Dm Sans',
        fontWeight: FontWeight.w400,
        fontSize: 15,
        color: AppColors.richBlack,
      );

  static TextStyle get productPrice => const TextStyle(
        fontFamily: 'Dm Sans',
        fontWeight: FontWeight.w400,
        fontSize: 20,
        color: AppColors.richBlack,
      );

  static TextStyle get installmentValue => const TextStyle(
        fontFamily: 'Dm Sans',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: AppColors.primary,
      );

  static TextStyle get productPriceDiscounted => const TextStyle(
        fontFamily: 'Dm Sans',
        fontWeight: FontWeight.w400,
        fontSize: 13,
        decoration: TextDecoration.lineThrough,
        decorationColor: AppColors.grey,
        color: AppColors.grey,
      );
  static TextStyle get productCondiction => const TextStyle(
        fontFamily: 'Dm Sans',
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: AppColors.grey,
      );

  static TextStyle get day => const TextStyle(
        fontFamily: 'Dm Sans',
        fontWeight: FontWeight.w600,
        fontSize: 13,
        color: AppColors.grey,
      );
  static TextStyle get productsLength => const TextStyle(
        fontFamily: 'Dm Sans',
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: AppColors.richBlack,
      );
  static TextStyle get lastsAnnouncement => const TextStyle(
        fontFamily: 'Dm Sans',
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color: AppColors.richBlack,
      );

  static TextStyle get percentageOFF => const TextStyle(
        fontFamily: 'Dm Sans',
        fontWeight: FontWeight.w700,
        fontSize: 9,
        color: Colors.white,
      );

  static TextStyle get filter => const TextStyle(
        fontFamily: 'Dm Sans',
        fontWeight: FontWeight.w700,
        fontSize: 13,
        color: Colors.white,
      );
}
