// I'm not a fan of using Equatable within the domain as it shouldn't rely on external packages.
// Therefore, since this is a simpler project, I won't be using it.

class CategoriesEntity {
  final List<String> categories;

  const CategoriesEntity({required this.categories});
}
