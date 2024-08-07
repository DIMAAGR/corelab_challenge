import 'package:flutter_modular/flutter_modular.dart';

import '../main_module.dart';
import 'data/datasource/search_remote_data_source.dart';
import 'data/repositories/search_repository.dart';
import 'domain/use_cases/fetch_search_use_case.dart';
import 'pages/controllers/search_controller.dart';
import 'pages/search_page.dart';

class SearchModule extends Module {
  @override
  List<Module> get imports => [MainModule()];

  void _controller(Injector i) {
    i.addLazySingleton(SearchPageController.new);
  }

  void _useCases(Injector i) {
    i.add<IFetchSearchUseCase>(FetchSearchUseCase.new);
  }

  void _repositories(Injector i) {
    i.add<ISearchRepository>(SearchRepository.new);
  }

  void _dataSources(Injector i) {
    i.add<ISearchRemoteDataSource>(SearchRemoteDataSource.new);
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
    r.child(
      '/',
      child: (ctx) => SearchPage(
        controller: Modular.get(),
        searchQuery: r.args.data['query'] ?? '',
      ),
    );
  }
}
