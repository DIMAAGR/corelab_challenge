
import 'package:dartz/dartz.dart';

import '../../data/repositories/search_local_repository.dart';

abstract class IGetSearchListUseCase {
  Future<Either<Exception, List<String>>> call();
}

class GetSearchListUseCase implements IGetSearchListUseCase {
  final ISearchLocalRepository _repository;

  const GetSearchListUseCase(this._repository);

  @override
  Future<Either<Exception, List<String>>> call() => _repository.getSearchTerms();
}
