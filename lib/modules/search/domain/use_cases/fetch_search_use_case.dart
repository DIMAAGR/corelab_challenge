import 'package:corelab_challenge/modules/search/data/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';

import '../entities/search_product_entity.dart';

abstract class IFetchSearchUseCase {
  Future<Either<Exception, List<SearchProductEntity>>> call(String value);
}

class FetchSearchUseCase implements IFetchSearchUseCase {
  final ISearchRepository _repository;

  const FetchSearchUseCase(this._repository);

  @override
  Future<Either<Exception, List<SearchProductEntity>>> call(String value) =>
      _repository.fetchSearch(value);
}
