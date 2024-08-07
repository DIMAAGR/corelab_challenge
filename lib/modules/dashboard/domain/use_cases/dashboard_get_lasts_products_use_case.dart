import 'package:dartz/dartz.dart';

import '../../data/repositories/dashboard_repository.dart';
import '../entities/dashboard_product_entity.dart';

abstract class IDashboardGetLastProductsUseCase {
  Future<Either<Exception, List<DashboardProductEntity>>> call();
}

class DashboardGetLastsProductsUseCase implements IDashboardGetLastProductsUseCase {
  final IDashboardRepository _repository;

  DashboardGetLastsProductsUseCase(this._repository);

  @override
  Future<Either<Exception, List<DashboardProductEntity>>> call() => _repository.getLastsProducts();
}
