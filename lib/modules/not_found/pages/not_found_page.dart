import 'package:corelab_challenge/modules/shared/pages/widgets/not_found_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/domain/enums/pages.dart';
import '../../shared/pages/widgets/inferior_menu.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('------------------------------------------------');
    debugPrint('[LOG][NOT_FOUND] OPS! Parece que você caiu aqui!');
    debugPrint('[LOG][NOT_FOUND] logo abaixo estão algumas\n' 
               'informações que parecem interessantes!\n');
    debugPrint('[LOG][NOT_FOUND] path: ${Modular.to.path}');
    debugPrint('------------------------------------------------');

    return Scaffold(
      appBar: AppBar(foregroundColor: Colors.white),
      body: const Center(child: NotFoundMessage()),
      bottomNavigationBar: const InferiorMenu(page: Pages.none),
    );
  }
}
