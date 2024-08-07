import 'package:corelab_challenge/modules/dashboard/pages/controllers/dashboard_controller.dart';
import 'package:corelab_challenge/modules/shared/domain/enums/pages.dart';
import 'package:corelab_challenge/modules/shared/pages/widgets/inferior_menu.dart';
import 'package:corelab_challenge/modules/shared/pages/widgets/search/searcher_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DashboardPage extends StatelessWidget {
  final DashboardController controller;
  const DashboardPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  SearcherAppBar(controller: Modular.get()),
     // body: const Center(child: Text('DASHBOARD')),
      bottomNavigationBar: const InferiorMenu(page: Pages.dashboard),
      
    );
  }
}
