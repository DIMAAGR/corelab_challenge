import 'package:flutter_modular/flutter_modular.dart';

import 'pages/not_found_page.dart';

class NotFoundModule extends Module {
  void _controller(Injector i) {}

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
    r.child('/', child: (ctx) => const NotFoundPage());
  }
}
