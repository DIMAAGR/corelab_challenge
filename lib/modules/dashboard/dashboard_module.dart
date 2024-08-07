import 'package:flutter_modular/flutter_modular.dart';

import '../main_module.dart';
import 'data/datasource/dashboard_remote_data_source.dart';
import 'data/repositories/dashboard_repository.dart';
import 'domain/use_cases/dashboard_get_lasts_products_use_case.dart';
import 'pages/controllers/dashboard_controller.dart';
import 'pages/dashboard_page.dart';

class DashboardModule extends Module {
  @override
  List<Module> get imports => [MainModule()];

  void _controller(Injector i) {
    i.addLazySingleton(DashboardController.new);
  }

  void _useCases(Injector i) {
    i.add<IDashboardGetLastProductsUseCase>(DashboardGetLastsProductsUseCase.new);
  }

  void _repositories(Injector i) {
    i.add<IDashboardRepository>(DashboardRepository.new);
  }

  void _dataSources(Injector i) {
    i.add<IDashboardRemoteDataSource>(DashboardRemoteDataSource.new);
  }

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
