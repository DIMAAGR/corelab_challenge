import 'package:flutter/material.dart';

import '../../shared/domain/enums/menu_page.dart';
import '../../shared/pages/widgets/inferior_menu.dart';
import 'controllers/categories_controller.dart';

class CategoriesPage extends StatelessWidget {
  final CategoriesController controller;
  const CategoriesPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('CATEGORIES')),
      bottomNavigationBar: InferiorMenu(page: MenuPage.categories),
    );
  }
}
