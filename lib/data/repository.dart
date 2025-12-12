import 'package:dio/dio.dart';
import 'package:harry_potter/model/harry_model.dart';

class Repository {
  final dio = Dio();
  Future<List<HarryModel>> getCharacters() async {
    final response = await dio.get('https://potterapi-fedeperin.vercel.app/en/characters',);
    final data = response.data;
    return (data as List)
        .map((item) => HarryModel.fromJson(item))
        .toList();
  }
}