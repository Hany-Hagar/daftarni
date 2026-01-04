// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PreferencesModelAdapter extends TypeAdapter<PreferencesModel> {
  @override
  final int typeId = 0;

  @override
  PreferencesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PreferencesModel(
      themeMode: fields[0] as String,
      languageCode: fields[1] as String,
      themeI: fields[2] as int,
      langI: fields[3] as int,
      enableNotifications: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, PreferencesModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.themeMode)
      ..writeByte(1)
      ..write(obj.languageCode)
      ..writeByte(2)
      ..write(obj.themeI)
      ..writeByte(3)
      ..write(obj.langI)
      ..writeByte(4)
      ..write(obj.enableNotifications);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PreferencesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
