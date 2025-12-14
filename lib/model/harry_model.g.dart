// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'harry_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HarryModelAdapter extends TypeAdapter<HarryModel> {
  @override
  final int typeId = 0;

  @override
  HarryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HarryModel(
      fields[0] as String,
      fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HarryModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.fullName)
      ..writeByte(1)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HarryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HarryModel _$HarryModelFromJson(Map<String, dynamic> json) => HarryModel(
      json['fullName'] as String,
      json['image'] as String,
    );

Map<String, dynamic> _$HarryModelToJson(HarryModel instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'image': instance.image,
    };
