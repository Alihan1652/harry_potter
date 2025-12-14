import 'package:hive_flutter/adapters.dart';
import '../model/harry_model.dart';

class HiveHelper {
  static const String boxName = 'characters';

  Future<void> saveList(List<HarryModel> list) async {
    final box = await Hive.openBox<HarryModel>(boxName);
    await box.clear();
    await box.addAll(list);
  }

  Future<List<HarryModel>> getList() async {
    final box = await Hive.openBox<HarryModel>(boxName);
    return box.values.toList();
  }
}