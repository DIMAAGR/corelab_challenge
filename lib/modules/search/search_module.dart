import 'package:corelab_challenge/modules/search/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SearchModule extends Module {
  void _controller(Injector i) {
    i.addLazySingleton(SearchController.new);
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
    r.child('/', child: (ctx) => SearchPage(controller: Modular.get()));
  }
}
