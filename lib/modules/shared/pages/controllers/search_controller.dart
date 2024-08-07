import 'package:corelab_challenge/modules/shared/domain/use_cases/add_search_history_data_use_case.dart';
import 'package:corelab_challenge/modules/shared/domain/use_cases/get_search_list_use_case.dart';
import 'package:corelab_challenge/modules/shared/domain/use_cases/remove_search_history_data_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/enums/pages.dart';

class SearchBarController extends ChangeNotifier {
  final IAddSearchHistoryDataUseCase _addSearchHistoryDataUseCase;
  final IRemoveSearchHistoryDataUseCase _removeSearchHistoryDataUseCase;
  final IGetSearchListUseCase _getSearchListUseCase;

  SearchBarController(
    this._addSearchHistoryDataUseCase,
    this._getSearchListUseCase,
    this._removeSearchHistoryDataUseCase,
  );

  final ValueNotifier<bool> showCloseButton = ValueNotifier(false);
  final ValueNotifier<double> appbarHeight = ValueNotifier(kToolbarHeight + 28);
  final ValueNotifier<List<String>> searches = ValueNotifier([]);

  final TextEditingController textController = TextEditingController();

  void adjustAppBarHeight(double deviceHeight) {
    appbarHeight.value = deviceHeight - (kToolbarHeight + 28 + 72);
  }

  void resetAppBarHeight() {
    appbarHeight.value = kToolbarHeight + 28;
  }

  Future<void> getSearches() async {
    final result = await _getSearchListUseCase();

    result.fold(
      (e) => debugPrint(e.toString()),
      (s) => searches.value = s,
    );
  }

  Future<void> removeSearch(String value) async {
    final result = await _removeSearchHistoryDataUseCase(value);

    result.fold(
      (e) => debugPrint(e.toString()),
      (s) => getSearches(),
    );
  }

  void _openSearchPage(String value) {
    showCloseButton.value = false;
    textController.text = value;

    if (Modular.to.path != Pages.search.toString()) {
      Modular.to.pushNamed('${Pages.search}', arguments: {'query': value});
    }
  }

  void backPage() {
    showCloseButton.value = false;
    textController.text = '';

    Modular.to.pop();
  }

  void clearAndBackToDashboard() {
    textController.clear();
    showCloseButton.value = false;
    if (Modular.to.path == Pages.search.toString()) {
      Modular.to.pop();
    }
  }

  Future<void> doSearch(String value) async {
    if (value.isNotEmpty) {
      final result = await _addSearchHistoryDataUseCase(value);

      result.fold(
        (e) => debugPrint(e.toString()),
        (s) => _openSearchPage(value),
      );
    }
  }

  Future<void> toggleCloseButtonVisibility(bool shouldShowCloseButton) async {
    if (shouldShowCloseButton != showCloseButton.value) {
      showCloseButton.value = shouldShowCloseButton;
    }
  }
}
