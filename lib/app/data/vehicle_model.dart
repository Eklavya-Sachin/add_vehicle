import 'package:hive/hive.dart';
part 'vehicle_model.g.dart';

@HiveType(typeId: 1)
class VehicleModel {
  @HiveField(0)
  String? vehicleNumber;

  @HiveField(1)
  String? vehicleBrand;

  @HiveField(2)
  String? vehicleModel;

  @HiveField(3)
  String? vehicleFuelType;

  @HiveField(4)
  String? vehicleTransmission;

  VehicleModel({
    required this.vehicleNumber,
    required this.vehicleBrand,
    required this.vehicleModel,
    required this.vehicleFuelType,
    required this.vehicleTransmission,
  });
}
