import 'package:flutter_ex/core/data/local/constant/local_constant.dart';
import 'package:hive/hive.dart';

class HiveService {

  late Box<dynamic> _box;

  HiveService() {
    _box = Hive.box(LocalConstant.database);
  }

  void set<T>(String key, T? data) => _box.put(key, data);

  T? get<T>(String key) => _box.get(key);

  void clear() => _box.clear();

}