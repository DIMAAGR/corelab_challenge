import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/enums/pages.dart';
import '../styles/colors.dart';
import '../styles/text_styles.dart';
import 'icons/icons.dart';
import 'icons/icons_data.dart';

class InferiorMenu extends StatelessWidget {
  final Pages page;

  const InferiorMenu({
    super.key,
    required this.page,
  });

  void _pushNamedAndRemoveUntilTo(Pages page) {
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
          _PagesButton(
            onTap: _pushNamedAndRemoveUntilTo,
            title: 'Home',
            actualPage: page,
            page: Pages.dashboard,
            icon: AppIconData.home,
          ),
          _PagesButton(
            onTap: _pushNamedAndRemoveUntilTo,
            title: 'Categorias',
            actualPage: page,
            page: Pages.categories,
            icon: AppIconData.categories,
          ),
          _PagesButton(
            onTap: _pushNamedAndRemoveUntilTo,
            title: 'Anunciar',
            actualPage: page,
            page: Pages.announce,
            icon: AppIconData.add,
          ),
          _PagesButton(
            onTap: _pushNamedAndRemoveUntilTo,
            title: 'Favoritos',
            actualPage: page,
            page: Pages.favorites,
            icon: AppIconData.favorites,
          ),
          _PagesButton(
            onTap: _pushNamedAndRemoveUntilTo,
            title: 'Conta',
            actualPage: page,
            page: Pages.account,
            icon: AppIconData.user,
          ),
        ],
      ),
    );
  }
}

class _PagesButton extends StatelessWidget {
  final void Function(Pages) onTap;
  final String title;
  final AppIconData icon;
  final Pages actualPage;
  final Pages page;

  const _PagesButton({
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
