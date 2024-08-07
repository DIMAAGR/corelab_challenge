import 'dart:math';

import '../models/search_product_model.dart';

abstract class ISearchRemoteDataSource {
  Future<List<SearchProductModel>> fetchSearch(String value);
}

class SearchRemoteDataSource implements ISearchRemoteDataSource {
  /// Obviously, if this were a real API, it would return the search data. Since this is just an
  /// example, I've implemented it with some randomness. There is a chance that when you search,
  /// it might return random data, and there's also a chance that it won't return anything,
  /// as if the system's database couldn't find your query!
  @override
  Future<List<SearchProductModel>> fetchSearch(String value) {
    return Future.delayed(
      const Duration(seconds: 3),
      () async {
        int random = Random.secure().nextInt(100);
        if (random < 90) {
          return List.generate(Random.secure().nextInt(15), (i) {
            if (i % 2 == 0) {
              return SearchProductModel.fromJson({
                'title': 'Sabonete Líquido Granado Bebê Tradicional Refil 250ml',
                'condiction': 'new',
                'discount': '0.2',
                'price': '21.99',
                'image_url':
                    'https://giassi.vtexassets.com/arquivos/ids/1157510/Sabonete-Liquido-de-Glicerina-Tradicional-Granado-Bebe-Sache-250ml-Refil.png?v=638509600972300000',
              });
            } else {
              return SearchProductModel.fromJson({
                'title': 'Benegrip Antigripal 6 Comprimidos',
                'condiction': 'new',
                'discount': '0',
                'price': '11.39',
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
