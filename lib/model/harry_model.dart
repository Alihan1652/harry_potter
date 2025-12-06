import 'package:json_annotation/json_annotation.dart';

part 'harry_model.g.dart';

@JsonSerializable()
class HarryModel {
  final String fullName;
  final String image;

  HarryModel(this.fullName, this.image);

  factory HarryModel.fromJson(Map<String, dynamic> json) =>
      _$HarryModelFromJson(json);

  Map<String, dynamic> toJson() => _$HarryModelToJson(this);
}
