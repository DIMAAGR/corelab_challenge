class AppIconData {
  final String _path;
  AppIconData._(this._path);

  static final AppIconData add = AppIconData._('assets/svg/ic-add-new.svg');
  static final AppIconData categories = AppIconData._('assets/svg/ic-categories.svg');
  static final AppIconData favorites = AppIconData._('assets/svg/ic-favorites.svg');
  static final AppIconData home = AppIconData._('assets/svg/ic-home.svg');
  static final AppIconData user = AppIconData._('assets/svg/ic-user.svg');

  @override
  String toString() => _path;
}
