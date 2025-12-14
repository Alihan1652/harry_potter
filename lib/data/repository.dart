import 'package:dio/dio.dart';
import 'package:harry_potter/data/hive_helper.dart';

import '../model/harry_model.dart';

class Repository {
  final Dio dio = Dio();
  final HiveHelper hiveHelper = HiveHelper();

  Future<List<HarryModel>> getCharacters() async {
    try {
      final response = await dio.get(
        'https://potterapi-fedeperin.vercel.app/en/characters',
      );

      final data = response.data as List;
      final list =
      data.map((e) => HarryModel.fromJson(e)).toList();

      await hiveHelper.saveList(list);
      return list;
    } catch (_) {
      final cached = await hiveHelper.getList();

      if (cached.isNotEmpty) {
        return cached;
      }

      throw Exception('Нет интернета и локальных данных');
    }
  }
}
