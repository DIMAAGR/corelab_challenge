import 'package:dartz/dartz.dart';

import '../../domain/entities/dashboard_product_entity.dart';
import '../datasource/dashboard_remote_data_source.dart';

abstract class IDashboardRepository {
  Future<Either<Exception, List<DashboardProductEntity>>> getLastsProducts();
}

class DashboardRepository implements IDashboardRepository {
  final IDashboardRemoteDataSource _dataSource;

  DashboardRepository(this._dataSource);

  @override
  Future<Either<Exception, List<DashboardProductEntity>>> getLastsProducts() async {
    try {
      final result = await _dataSource.getLastsProducts();
      final data = result.map((e) => e.toEntity()).toList();
      return Right(data);
    } catch (e) {
      return Left(e as Exception);
    }
  }
}
