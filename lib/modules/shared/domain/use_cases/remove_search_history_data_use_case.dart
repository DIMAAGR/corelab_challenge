import 'package:dartz/dartz.dart';

import '../../data/repositories/search_local_repository.dart';

abstract class IRemoveSearchHistoryDataUseCase {
  Future<Either<Exception, void>> call(String value);
}

class RemoveSearchHistoryDataUseCase implements IRemoveSearchHistoryDataUseCase {
  final ISearchLocalRepository _repository;

  const RemoveSearchHistoryDataUseCase(this._repository);

  @override
  Future<Either<Exception, void>> call(String value) => _repository.removeSearchTerm(value);
}
