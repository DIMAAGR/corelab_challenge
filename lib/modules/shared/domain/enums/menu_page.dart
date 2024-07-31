enum MenuPage {
  dashboard('/'),
  categories('/categories/'),
  announce('/announce/'),
  favorites('/favorites/'),
  account('/account/');

  final String _path;

  const MenuPage(this._path);
  @override
  String toString() => _path;
}
