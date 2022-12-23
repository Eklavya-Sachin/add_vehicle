import '../../widgets/vehicle_detail_tile.dart';
import 'package:get/route_manager.dart';
import 'package:flutter/material.dart';
import 'vehicle_transmission.dart';

class VehicleFuelType extends StatefulWidget {
  final String numController;
  const VehicleFuelType({Key? key, required this.numController})
      : super(key: key);

  @override
  State<VehicleFuelType> createState() => _VehicleFuelTypeState();
}

class _VehicleFuelTypeState extends State<VehicleFuelType> {
  final _data = Get.arguments;

  List<String> fuelTypeList = [
    "Petrol",
    "Diesel",
    "CNG",
    "Petrol + CNG",
    "Electric",
    "Hybrid",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Fuel Type"),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        titleSpacing: 0,
      ),
      body: ListView.builder(
        itemCount: fuelTypeList.length,
        itemBuilder: (context, index) => InkWell(
            onTap: () => Get.to(
                  () =>
                      VehicleTransmission(numController: widget.numController),
                  arguments: [_data, fuelTypeList[index]],
                ),
            child: VehicleDetialTile(
              name: fuelTypeList[index],
            )),
      ),
    );
  }
}
