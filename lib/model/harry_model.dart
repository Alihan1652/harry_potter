import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'harry_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class HarryModel {
  @HiveField(0)
  final String fullName;

  @HiveField(1)
  final String image;

  HarryModel(this.fullName, this.image);

  factory HarryModel.fromJson(Map<String, dynamic> json) =>
      _$HarryModelFromJson(json);

  Map<String, dynamic> toJson() => _$HarryModelToJson(this);
}