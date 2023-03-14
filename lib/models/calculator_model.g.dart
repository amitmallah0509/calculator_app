// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculator_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CalculatorAdapter extends TypeAdapter<Calculator> {
  @override
  final int typeId = 1;

  @override
  Calculator read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Calculator(
      calculateValue: fields[0] as String,
      total: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Calculator obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.calculateValue)
      ..writeByte(1)
      ..write(obj.total);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CalculatorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
