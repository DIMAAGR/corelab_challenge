class AppIconData {
  final String _path;
  AppIconData._(this._path);

  static final AppIconData add = AppIconData._('assets/svg/icons/ic-add-new.svg');
  static final AppIconData categories = AppIconData._('assets/svg/icons/ic-categories.svg');
  static final AppIconData favorites = AppIconData._('assets/svg/icons/ic-favorites.svg');
  static final AppIconData home = AppIconData._('assets/svg/icons/ic-home.svg');
  static final AppIconData user = AppIconData._('assets/svg/icons/ic-user.svg');
  static final AppIconData search = AppIconData._('assets/svg/icons/ic-search.svg');

  @override
  String toString() => _path;
}
