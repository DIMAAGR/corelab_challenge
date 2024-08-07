import 'dart:math';

import '../models/dashboard_product_model.dart';

abstract class IDashboardRemoteDataSource {
  Future<List<DashboardProductModel>> getLastsProducts();
}

class DashboardRemoteDataSource implements IDashboardRemoteDataSource {
  @override
  Future<List<DashboardProductModel>> getLastsProducts() {
    return Future.delayed(
      const Duration(seconds: 3),
      () async {
        int random = Random.secure().nextInt(100);
        if (random < 90) {
          return List.generate(Random.secure().nextInt(15), (i) {
            if (i % 2 == 0) {
              return DashboardProductModel.fromJson({
                'title': 'Sabonete Líquido Granado Bebê Tradicional Refil 250ml',
                'condiction': 'new',
                'discount': '0.2',
                'price': '21.99',
                'created_at': (Random.secure().nextInt(2) + 1) == 2 ? '2024-08-06' : '2024-08-07',
                'image_url':
                    'https://giassi.vtexassets.com/arquivos/ids/1157510/Sabonete-Liquido-de-Glicerina-Tradicional-Granado-Bebe-Sache-250ml-Refil.png?v=638509600972300000',
              });
            } else {
              return DashboardProductModel.fromJson({
                'title': 'Benegrip Antigripal 6 Comprimidos',
                'condiction': 'new',
                'discount': '0',
                'price': '11.39',
                'created_at': (Random.secure().nextInt(2) + 1) == 2 ? '2024-08-06' : '2024-08-07',
                'image_url':
                    'https://paguemenos.vtexassets.com/arquivos/ids/693361-1200-auto?v=638242471134200000&width=1200&height=auto&aspect=true'
              });
            }
          });
        } else if (random > 40 && random < 90) {
          return [];
        } else {
          throw Exception({'code': '500', 'message': 'internal_server_error'});
        }
      },
    );
  }
}
