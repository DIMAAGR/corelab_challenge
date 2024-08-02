import 'package:corelab_challenge/modules/categories/categories_module.dart';
import 'package:corelab_challenge/modules/dashboard/dashboard_module.dart';
import 'package:corelab_challenge/modules/not_found/pages/not_found_page.dart';
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
