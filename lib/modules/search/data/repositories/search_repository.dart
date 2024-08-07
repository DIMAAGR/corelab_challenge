import 'package:dartz/dartz.dart';

import '../../domain/entities/search_product_entity.dart';
import '../datasource/search_remote_data_source.dart';

abstract class ISearchRepository {
  Future<Either<Exception, List<SearchProductEntity>>> fetchSearch(String value);
}

class SearchRepository implements ISearchRepository {
  final ISearchRemoteDataSource _dataSource;

  SearchRepository(this._dataSource);

  @override
  Future<Either<Exception, List<SearchProductEntity>>> fetchSearch(String value) async {
    try {
      final result = await _dataSource.fetchSearch(value);
      final data = result.map((e) => e.toEntity()).toList();
      return Right(data);
    } catch (e) {
      return Left(e as Exception);
    }
  }
}
