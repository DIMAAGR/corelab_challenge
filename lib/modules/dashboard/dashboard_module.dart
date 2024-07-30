import 'package:corelab_challenge/modules/dashboard/pages/controllers/dashboard_controller.dart';
import 'package:corelab_challenge/modules/dashboard/pages/dashboard_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DashboardModule extends Module {
  void _controller(Injector i) {
    i.addLazySingleton(DashboardController.new);
  }

  void _useCases(Injector i) {}

  void _repositories(Injector i) {}

  void _dataSources(Injector i) {}

  @override
  void binds(Injector i) {
    _controller(i);
    _useCases(i);
    _repositories(i);
    _dataSources(i);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (ctx) => DashboardPage(controller: Modular.get()));
  }
}
