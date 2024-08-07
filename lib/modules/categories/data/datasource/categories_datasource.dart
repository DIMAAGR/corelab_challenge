import 'dart:math';

import '../models/categories_model.dart';

abstract class ICategoriesDataSource {
  Future<CategoriesModel> getCategories();
}

class CategoriesDatasource implements ICategoriesDataSource {
  @override
  Future<CategoriesModel> getCategories() {
    return Future.delayed(
      const Duration(seconds: 3),
      () async {
        int random = Random.secure().nextInt(100);
        if (random < 90) {
          return CategoriesModel.fromJson({
            'categories': [
              "Anestésicos e Agulhas Gengival",
              "Biossegurança",
              "Descartáveis",
              "Dentística e Estética",
              "Ortodontia",
              "Endodontia",
              "Periféricos e Peças de Mão",
              "Moldagem",
              "Prótese",
              "Cimentos",
              "Instrumentos",
              "Cirurgia e Periodontia",
              "Radiologia"
            ],
          });
        } else {
          throw Exception({'code': '500', 'message': 'internal_server_error'});
        }
      },
    );
  }
}
