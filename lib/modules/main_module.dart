import 'package:corelab_challenge/modules/categories/categories_module.dart';
import 'package:corelab_challenge/modules/dashboard/dashboard_module.dart';
import 'package:corelab_challenge/modules/not_found/pages/not_found_page.dart';
import 'package:corelab_challenge/modules/search/search_module.dart';
import 'package:corelab_challenge/modules/shared/data/datasources/search_local_data_source.dart';
import 'package:corelab_challenge/modules/shared/data/repositories/search_local_repository.dart';
import 'package:corelab_challenge/modules/shared/domain/use_cases/add_search_history_data_use_case.dart';
import 'package:corelab_challenge/modules/shared/domain/use_cases/get_search_list_use_case.dart';
import 'package:corelab_challenge/modules/shared/domain/use_cases/remove_search_history_data_use_case.dart';
import 'package:corelab_challenge/modules/shared/pages/controllers/search_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MainModule extends Module {
  void _services(Injector i) {}

  void _controller(Injector i) {
    i.addLazySingleton(SearchBarController.new);
  }

  void _useCases(Injector i) {
    i.add<IGetSearchListUseCase>(GetSearchListUseCase.new);
    i.add<IAddSearchHistoryDataUseCase>(AddSearchHistoryDataUseCase.new);
    i.add<IRemoveSearchHistoryDataUseCase>(RemoveSearchHistoryDataUseCase.new);
  }

  void _repositories(Injector i) {
    i.add<ISearchLocalRepository>(SearchLocalRepository.new);
  }

  void _dataSources(Injector i) {
    i.add<ISearchLocalDataSource>(SearchLocalDataSource.new);
  }

  @override
  void exportedBinds(Injector i) {
    _services(i);
    _useCases(i);
    _repositories(i);
    _dataSources(i);
    _controller(i);
  }

  /// I left the routes as direct strings because this way each module manages
  /// its own routes and dependencies, facilitating maintenance and scalability,
  ///  allowing for module independence.

  @override
  void routes(RouteManager r) {
    r.module(
      '/',
      module: DashboardModule(),
      transition: TransitionType.noTransition,
    );
    r.module(
      '/search/',
      module: SearchModule(),
      transition: TransitionType.noTransition,
    );
    r.module(
      '/categories/',
      module: CategoriesModule(),
      transition: TransitionType.noTransition,
    );

    /// When some error occourred, the modular throw this page.
    r.wildcard(
      child: (_) => const NotFoundPage(),
      transition: TransitionType.noTransition,
    );
  }
}
