import 'package:shared_preferences/shared_preferences.dart';

abstract class ISearchLocalDataSource {
  Future<void> add(String value);
  Future<void> remove(String value);
  Future<List<String>> get();
}

class SearchLocalDataSource implements ISearchLocalDataSource {
  static const _listKey = 'searchers';

  @override
  Future<void> add(String value) async {
    final db = await SharedPreferences.getInstance();

    List<String>? list = db.getStringList(_listKey);

    if (list != null && list.contains(value)) {
      list.removeWhere((item) => item == value);
    }

    list = [value, ...list ?? []];
    db.setStringList(_listKey, list);
  }

  @override
  Future<List<String>> get() async {
    final db = await SharedPreferences.getInstance();
    return db.getStringList(_listKey) ?? [];
  }

  @override
  Future<void> remove(String value) async {
    final db = await SharedPreferences.getInstance();

    List<String>? list = db.getStringList(_listKey);
    list!.removeWhere((item) => item == value);
  }
}
