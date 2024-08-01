import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/enums/menu_page.dart';
import '../styles/colors.dart';
import '../styles/text_styles.dart';
import 'icons/icons.dart';
import 'icons/icons_data.dart';

class InferiorMenu extends StatelessWidget {
  final MenuPage page;

  const InferiorMenu({
    super.key,
    required this.page,
  });

  void _pushNamedAndRemoveUntilTo(MenuPage page) {
    Modular.to.pushNamedAndRemoveUntil(
      page.toString(),
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final shadow = [
      const BoxShadow(
        blurRadius: 20,
        offset: Offset(0, 2),
        color: AppColors.shadowColor1,
      ),
    ];

    return Container(
      height: 72,
      padding: const EdgeInsets.only(bottom: 16, top: 8),
      decoration: BoxDecoration(
        boxShadow: shadow,
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          _MenuPageButton(
            onTap: _pushNamedAndRemoveUntilTo,
            title: 'Home',
            actualPage: page,
            page: MenuPage.dashboard,
            icon: AppIconData.home,
          ),
          _MenuPageButton(
            onTap: _pushNamedAndRemoveUntilTo,
            title: 'Categorias',
            actualPage: page,
            page: MenuPage.categories,
            icon: AppIconData.categories,
          ),
          _MenuPageButton(
            onTap: _pushNamedAndRemoveUntilTo,
            title: 'Anunciar',
            actualPage: page,
            page: MenuPage.announce,
            icon: AppIconData.add,
          ),
          _MenuPageButton(
            onTap: _pushNamedAndRemoveUntilTo,
            title: 'Favoritos',
            actualPage: page,
            page: MenuPage.favorites,
            icon: AppIconData.favorites,
          ),
          _MenuPageButton(
            onTap: _pushNamedAndRemoveUntilTo,
            title: 'Conta',
            actualPage: page,
            page: MenuPage.account,
            icon: AppIconData.user,
          ),
        ],
      ),
    );
  }
}

class _MenuPageButton extends StatelessWidget {
  final void Function(MenuPage) onTap;
  final String title;
  final AppIconData icon;
  final MenuPage actualPage;
  final MenuPage page;

  const _MenuPageButton({
    required this.onTap,
    required this.title,
    required this.icon,
    required this.actualPage,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    Color foregroundColor = AppColors.grey;

    if (page == actualPage) foregroundColor = AppColors.primary;

    return InkWell(
      onTap: () => onTap(page),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppIcon(icon, color: foregroundColor, size: 32),
          Text(
            title,
            style: AppTextStyle.inferiorMenuTileTitle.copyWith(
              color: foregroundColor,
            ),
          ),
        ],
      ),
    );
  }
}
