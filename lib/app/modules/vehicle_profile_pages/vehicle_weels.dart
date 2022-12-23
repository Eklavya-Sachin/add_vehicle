import '../../widgets/vehicle_detail_tile.dart';
import 'package:get/route_manager.dart';
import 'package:flutter/material.dart';
import 'vehicle_brand_car.dart';
import 'vehicle_brand.dart';

class VehicleWeels extends StatelessWidget {
  final String numController;

  const VehicleWeels({Key? key, required this.numController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Category"),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        titleSpacing: 0,
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () =>
                Get.to(() => VehicleBrandBike(numController: numController)),
            child: const VehicleDetialTile(
              name: "Bike",
            ),
          ),
          InkWell(
            onTap: () =>
                Get.to(() => VehicleBrandCar(numController: numController)),
            child: const VehicleDetialTile(
              name: "Car",
            ),
          ),
        ],
      ),
    );
  }
}
