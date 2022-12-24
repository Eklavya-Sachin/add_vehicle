// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VehicleModelAdapter extends TypeAdapter<VehicleModel> {
  @override
  final int typeId = 1;

  @override
  VehicleModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VehicleModel(
      vehicleNumber: fields[0] as String,
      vehicleBrand: fields[1] as String,
      vehicleModel: fields[2] as String,
      vehicleFuelType: fields[3] as String,
      vehicleTransmission: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, VehicleModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.vehicleNumber)
      ..writeByte(1)
      ..write(obj.vehicleBrand)
      ..writeByte(2)
      ..write(obj.vehicleModel)
      ..writeByte(3)
      ..write(obj.vehicleFuelType)
      ..writeByte(4)
      ..write(obj.vehicleTransmission);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VehicleModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
