import 'package:corelab_challenge/modules/shared/pages/widgets/not_found_message.dart';
import 'package:flutter/material.dart';

import '../../shared/domain/enums/menu_page.dart';
import '../../shared/pages/widgets/inferior_menu.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: NotFoundMessage()),
      bottomNavigationBar: const InferiorMenu(page: MenuPage.none),
    );
  }
}
