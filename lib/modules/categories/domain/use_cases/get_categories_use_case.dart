
import 'package:dartz/dartz.dart';

import '../../data/repositories/categories_repository.dart';
import '../entities/categories_entity.dart';

abstract class IGetCategoriesUseCase {
  Future<Either<CategoriesEntity, Exception>> call();
}

class GetCategoriesUseCase implements IGetCategoriesUseCase {
  final ICategoriesRepository _repository;

  const GetCategoriesUseCase(this._repository);

  @override
  Future<Either<CategoriesEntity, Exception>> call() => _repository.getCategories();
}
