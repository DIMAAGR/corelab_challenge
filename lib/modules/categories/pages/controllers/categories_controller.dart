import 'package:corelab_challenge/modules/categories/domain/entities/categories_entity.dart';
import 'package:corelab_challenge/modules/categories/domain/use_cases/get_categories_use_case.dart';
import 'package:flutter/material.dart';

class CategoriesController extends ChangeNotifier {
  final IGetCategoriesUseCase _getCategories;

  CategoriesController(this._getCategories);

  ValueNotifier<CategoriesEntity?> categories = ValueNotifier(null);

  Future<void> getCategories() async {
    final result = await _getCategories();

    result.fold(
      (success) => categories.value = success,
      (fail) => throw fail,
    );
  }
}
