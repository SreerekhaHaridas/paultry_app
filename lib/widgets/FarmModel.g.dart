// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FarmModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FarmDataModelAdapter extends TypeAdapter<FarmDataModel> {
  @override
  final int typeId = 0;

  @override
  FarmDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FarmDataModel(
      fields[0] as String,
      fields[2] as int,
      fields[1] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as DateTime,
      fields[6] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, FarmDataModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.farmname)
      ..writeByte(1)
      ..write(obj.location)
      ..writeByte(2)
      ..write(obj.capacity)
      ..writeByte(3)
      ..write(obj.attenderLedger)
      ..writeByte(4)
      ..write(obj.currentBatchId)
      ..writeByte(5)
      ..write(obj.currentDate)
      ..writeByte(6)
      ..write(obj.pastPickupDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FarmDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
