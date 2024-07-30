import 'package:flutter_modular/flutter_modular.dart';

class MainModule extends Module {
  void _services(Injector i) {}

  @override
  void exportedBinds(Injector i) {
    _services(i);
  }

  @override
  void routes(RouteManager r) {}
}
