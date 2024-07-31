import 'package:corelab_challenge/modules/dashboard/pages/controllers/dashboard_controller.dart';
import 'package:corelab_challenge/modules/shared/domain/enums/menu_page.dart';
import 'package:corelab_challenge/modules/shared/pages/widgets/inferior_menu.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  final DashboardController controller;
  const DashboardPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('DASHBOARD')),
      bottomNavigationBar: InferiorMenu(page: MenuPage.dashboard),
    );
  }
}
