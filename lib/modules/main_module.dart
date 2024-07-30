import 'package:corelab_challenge/modules/dashboard/dashboard_module.dart';
import 'package:corelab_challenge/modules/search/search_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MainModule extends Module {
  void _services(Injector i) {}

  @override
  void exportedBinds(Injector i) {
    _services(i);
  }

  /// I left the routes as direct strings because this way each module manages
  /// its own routes and dependencies, facilitating maintenance and scalability,
  ///  allowing for module independence.

  @override
  void routes(RouteManager r) {
    r.module('/', module: DashboardModule());
    r.module('/search/', module: SearchModule());
    r.module('/categories/', module: DashboardModule());
  }
}
