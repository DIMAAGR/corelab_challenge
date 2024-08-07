import 'package:corelab_challenge/modules/shared/pages/styles/colors.dart';
import 'package:corelab_challenge/modules/shared/pages/styles/text_styles.dart';
import 'package:corelab_challenge/modules/shared/pages/widgets/connection_unavailable_message.dart';
import 'package:flutter/material.dart';

import '../../shared/domain/enums/pages.dart';
import '../../shared/pages/widgets/inferior_menu.dart';
import 'controllers/categories_controller.dart';
import 'widgets/category_list_builder.dart';

class CategoriesPage extends StatelessWidget {
  final CategoriesController controller;
  const CategoriesPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    const bottomBarHeight = 72; // Actually the bottom bar height from inferior menu is 72;
    const appBarHeight = kToolbarHeight;

    final screenHeight = MediaQuery.of(context).size.height;
    final bodyHeight = screenHeight - appBarHeight - bottomBarHeight;

    return Scaffold(
      bottomNavigationBar: const InferiorMenu(page: Pages.categories),
      appBar: AppBar(
        title: Text('Categorias', style: AppTextStyle.appbar),
        backgroundColor: AppColors.background,
        surfaceTintColor: AppColors.background,
        shape: const Border(bottom: BorderSide(color: AppColors.aliceBlue)),
      ),
      body: ValueListenableBuilder(
        valueListenable: controller.categories,
        builder: (_, entity, __) {
          return FutureBuilder(
            future: controller.getCategories(),
            builder: (___, result) {
              if (result.hasError && entity == null) {
                return RefreshIndicator(
                  onRefresh: () => controller.getCategories().catchError((_) {}),
                  color: AppColors.primary,
                  backgroundColor: Colors.white,
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: SizedBox(
                      height: bodyHeight,
                      child: const ConnectionUnavailableMessage(),
                    ),
                  ),
                );
              } else {
                if (entity != null) {
                  // I know that adding texts like 'Lista de Categorias'
                  // (CategoriesList) is rounding something unnecessarily;
                  // the word 'categories' in plural already indicates
                  // that it is a list. So, I left it as 'entity'.
                  // Otherwise, to pass the category, I would have to use
                  // `categories: categories.categories.`

                  return CategoryListBuilder(categories: entity.categories);
                } else {
                  return const Center(
                    child: CircularProgressIndicator(color: AppColors.primary),
                  );
                }
              }
            },
          );
        },
      ),
    );
  }
}
