enum Pages {
  dashboard('/'),
  categories('/categories/'),
  announce('/announce/'),
  favorites('/favorites/'),
  account('/account/'),
  search('/search/'),
  none('');

  final String _path;

  const Pages(this._path);

  @override
  String toString() => _path;
}
