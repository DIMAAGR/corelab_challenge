import 'package:corelab_challenge/modules/search/domain/entities/search_product_entity.dart';
import 'package:corelab_challenge/modules/search/domain/use_cases/fetch_search_use_case.dart';
import 'package:flutter/material.dart';

// There is no need or justification in the current context of the application
// to create a more complex state manager for the controller.
// Given that the only expected error return is a 500, there is no need
// to create a StateController more complex than this.

enum SearchControllerState {
  idle,
  loading,
  success,
  error;

  bool get isLoading => this == loading;
  bool get isIdle => this == idle;
  bool get isSuccess => this == success;
  bool get isError => this == error;
}

class SearchPageController extends ChangeNotifier {
  final IFetchSearchUseCase _fetchSearchUseCase;

  SearchPageController(this._fetchSearchUseCase);

  final ValueNotifier<List<SearchProductEntity>> products = ValueNotifier([]);
  final ValueNotifier<SearchControllerState> isLoading = ValueNotifier(SearchControllerState.idle);

  String searchQuery = '';

  Future<void> fetchSearch(String value) async {
    isLoading.value = SearchControllerState.loading;

    searchQuery = value;
    final result = await _fetchSearchUseCase(value);

    result.fold(
      (fail) => isLoading.value = SearchControllerState.error,
      (success) {
        products.value = success;
        isLoading.value = SearchControllerState.success;
      },
    );
  }

  void clearProducts() {
    products.value = [];
  }
}
