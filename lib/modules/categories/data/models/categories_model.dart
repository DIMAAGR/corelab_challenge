import 'package:corelab_challenge/modules/categories/domain/entities/categories_entity.dart';

class CategoriesModel {
  final List<String>? categories;

  const CategoriesModel({this.categories});

  CategoriesModel.fromJson(Map<String, dynamic> json) : categories = json['categories'];

  CategoriesEntity toEntity() {
    return CategoriesEntity(categories: categories ?? []);
  }

  Map<String, dynamic> toMap() {
    return {'categories': categories};
  }
}
