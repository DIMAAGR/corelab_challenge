import 'package:corelab_challenge/modules/categories/pages/categories_page.dart';
import 'package:corelab_challenge/modules/categories/pages/controllers/categories_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CategoriesModule extends Module {
  void _controller(Injector i) {
    i.addLazySingleton(CategoriesController.new);
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
    r.child('/', child: (ctx) => CategoriesPage(controller: Modular.get()));
  }
}
