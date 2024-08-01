import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/app/main_app.dart';
import 'modules/main_module.dart';

void main() {
  runApp(
    ModularApp(module: MainModule(), child: const MainApp()),
  );
}
