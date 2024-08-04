
import 'package:corelab_challenge/modules/categories/data/datasource/categories_datasource.dart';
import 'package:corelab_challenge/modules/categories/data/repositories/categories_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'domain/use_cases/get_categories_use_case.dart';
import 'pages/categories_page.dart';
import 'pages/controllers/categories_controller.dart';

class CategoriesModule extends Module {
  void _controller(Injector i) {
    i.addLazySingleton(CategoriesController.new);
  }

  void _useCases(Injector i) {
    i.add<IGetCategoriesUseCase>(GetCategoriesUseCase.new);
  }

  void _repositories(Injector i) {
    i.add<ICategoriesRepository>(CategoriesRepository.new);
  }

  void _dataSources(Injector i) {
    i.add<ICategoriesDataSource>(CategoriesDatasource.new);
  }

  @override
  void binds(Injector i) {
    _useCases(i);
    _repositories(i);
    _dataSources(i);
    _controller(i);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (ctx) => CategoriesPage(controller: Modular.get<CategoriesController>()));
  }
}
