import 'package:dartz/dartz.dart';

import '../../domain/entities/categories_entity.dart';
import '../datasource/categories_datasource.dart';

abstract class ICategoriesRepository {
  Future<Either<CategoriesEntity, Exception>> getCategories();
}

class CategoriesRepository implements ICategoriesRepository {
  final ICategoriesDataSource _dataSource;

  const CategoriesRepository(this._dataSource);

  @override
  Future<Either<CategoriesEntity, Exception>> getCategories() async {
    try {
      final result = await _dataSource.getCategories();
      return Left(result.toEntity());
    } catch (e) {
      return Right(e as Exception);
    }
  }
}
