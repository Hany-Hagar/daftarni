// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BalanceModelAdapter extends TypeAdapter<BalanceModel> {
  @override
  final int typeId = 3;

  @override
  BalanceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BalanceModel(
      income: fields[0] as double,
      expense: fields[1] as double,
      progress: fields[2] as double,
      currentBalance: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, BalanceModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.income)
      ..writeByte(1)
      ..write(obj.expense)
      ..writeByte(2)
      ..write(obj.progress)
      ..writeByte(3)
      ..write(obj.currentBalance);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BalanceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
