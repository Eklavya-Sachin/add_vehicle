import '../../widgets/vehicle_detail_tile.dart';
import 'package:get/route_manager.dart';
import 'package:flutter/material.dart';
import 'vehicle_profile.dart';

class VehicleTransmission extends StatefulWidget {
  final String numController;
  const VehicleTransmission({Key? key, required this.numController})
      : super(key: key);

  @override
  State<VehicleTransmission> createState() => _VehicleTransmissionState();
}

class _VehicleTransmissionState extends State<VehicleTransmission> {
  final _data = Get.arguments;

  List<String> transmissionList = [
    "Manual",
    "Automatic",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Transmission"),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        titleSpacing: 0,
      ),
      body: ListView.builder(
        itemCount: transmissionList.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () => Get.to(
            () =>  VehicleProfile(numController: widget.numController),
            arguments: [_data, transmissionList[index]],
          ),
          child: VehicleDetialTile(
            name: transmissionList[index],
          ),
        ),
      ),
    );
  }
}
