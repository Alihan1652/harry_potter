part of 'harry_model.dart';

HarryModel _$HarryModelFromJson(Map<String, dynamic> json) => HarryModel
  (json['fullName'] as String,
    json['image'] as String
);

Map<String, dynamic> _$HarryModelToJson(HarryModel instance) =>
    <String, dynamic>{
  'fullName': instance.fullName,
      'image': instance.image
};
