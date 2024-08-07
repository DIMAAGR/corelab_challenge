import 'package:corelab_challenge/modules/dashboard/domain/use_cases/dashboard_get_lasts_products_use_case.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/dashboard_product_entity.dart';
// There is no need or justification in the current context of the application
// to create a more complex state manager for the controller.
// Given that the only expected error return is a 500, there is no need
// to create a StateController more complex than this.

enum DashboardControllerState {
  idle,
  loading,
  success,
  error;

  bool get isLoading => this == loading;
  bool get isIdle => this == idle;
  bool get isSuccess => this == success;
  bool get isError => this == error;
}

class DashboardController extends ChangeNotifier {
  final IDashboardGetLastProductsUseCase _getLastProductsUseCase;

  DashboardController(this._getLastProductsUseCase);

  final ValueNotifier<List<DashboardProductEntity>> products = ValueNotifier([]);
  final ValueNotifier<DashboardControllerState> isLoading =
      ValueNotifier(DashboardControllerState.idle);

  Future<void> getProducts() async {
    isLoading.value = DashboardControllerState.loading;

    final result = await _getLastProductsUseCase();

    result.fold(
      (fail) => isLoading.value = DashboardControllerState.error,
      (success) {
        success.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));

        products.value = success;
        isLoading.value = DashboardControllerState.success;
      },
    );
  }
}
