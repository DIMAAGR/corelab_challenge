
import 'package:dartz/dartz.dart';

import '../../data/repositories/search_local_repository.dart';

abstract class IAddSearchHistoryDataUseCase {
  Future<Either<Exception, void>> call(String value);
}

class AddSearchHistoryDataUseCase implements IAddSearchHistoryDataUseCase {
  final ISearchLocalRepository _repository;

  const AddSearchHistoryDataUseCase(this._repository);

  @override
  Future<Either<Exception, void>> call(String value) => _repository.addSearchTerm(value);
}
