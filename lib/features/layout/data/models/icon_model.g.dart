// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'icon_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IconModelAdapter extends TypeAdapter<IconModel> {
  @override
  final int typeId = 4;

  @override
  IconModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IconModel(
      codePoint: fields[0] as int,
      fontFamily: fields[1] as String?,
      fontPackage: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, IconModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.codePoint)
      ..writeByte(1)
      ..write(obj.fontFamily)
      ..writeByte(2)
      ..write(obj.fontPackage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IconModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
