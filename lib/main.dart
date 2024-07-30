import 'package:corelab_app_challenge/core/app/main_app.dart';
import 'package:corelab_app_challenge/modules/main_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  runApp(ModularApp(module: MainModule(), child: const MainApp()))
}
