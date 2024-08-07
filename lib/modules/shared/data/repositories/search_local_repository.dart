import 'package:dartz/dartz.dart';

import '../datasources/search_local_data_source.dart';

abstract class ISearchLocalRepository {
  Future<Either<Exception, void>> addSearchTerm(String value);
  Future<Either<Exception, void>> removeSearchTerm(String value);
  Future<Either<Exception, List<String>>> getSearchTerms();
}

class SearchLocalRepository implements ISearchLocalRepository {
  final ISearchLocalDataSource localDataSource;

  SearchLocalRepository(this.localDataSource);

  @override
  Future<Either<Exception, void>> addSearchTerm(String value) async {
    try {
      final result = await localDataSource.add(value);
      return Right(result); // Void methods should return null on success
    } catch (e) {
      return Left(Exception('Failed to add search term'));
    }
  }

  @override
  Future<Either<Exception, void>> removeSearchTerm(String value) async {
    try {
      final result = await localDataSource.remove(value);
      return Right(result); // Void methods should return null on success
    } catch (e) {
      return Left(Exception('Failed to remove search term'));
    }
  }

  @override
  Future<Either<Exception, List<String>>> getSearchTerms() async {
    try {
      final result = await localDataSource.get();
      return Right(result); 
    } catch (e) {
      return Left(Exception('Failed to retrieve search terms'));
    }
  }
}
