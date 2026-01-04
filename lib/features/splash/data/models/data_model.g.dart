// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DataModelAdapter extends TypeAdapter<DataModel> {
  @override
  final int typeId = 1;

  @override
  DataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataModel(
      preferences: fields[0] as PreferencesModel,
      profile: fields[1] as ProfileModel,
      categories: (fields[2] as List).cast<CategoryModel>(),
      transactions: (fields[3] as List).cast<TransactionModel>(),
      isFirstOpen: fields[4] as bool,
      isLoggedIn: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, DataModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.preferences)
      ..writeByte(1)
      ..write(obj.profile)
      ..writeByte(2)
      ..write(obj.categories)
      ..writeByte(3)
      ..write(obj.transactions)
      ..writeByte(4)
      ..write(obj.isFirstOpen)
      ..writeByte(5)
      ..write(obj.isLoggedIn);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
