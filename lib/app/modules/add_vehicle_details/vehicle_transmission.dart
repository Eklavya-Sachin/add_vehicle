import 'package:hive/hive.dart';
import '../../data/vehicle_model.dart';
import '../../widgets/vehicle_detail_tile.dart';
import 'package:get/route_manager.dart';
import 'package:flutter/material.dart';
import '../home/views/home_view.dart';

class VehicleTransmission extends StatefulWidget {
  final String numController;
  const VehicleTransmission({Key? key, required this.numController})
      : super(key: key);

  @override
  State<VehicleTransmission> createState() => _VehicleTransmissionState();
}

class _VehicleTransmissionState extends State<VehicleTransmission> {
  Box box = Hive.box("vehicle");

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
          onTap: () {
            box.add(
              VehicleModel(
                vehicleNumber: widget.numController,
                vehicleBrand: _data[0][0][0],
                vehicleModel: _data[0][1],
                vehicleFuelType: _data[1],
                vehicleTransmission: transmissionList[index],
              ),
            );
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomeView()),
              (route) => false,
            );
          },
          child: VehicleDetialTile(
            name: transmissionList[index],
          ),
        ),
      ),
    );
  }
}
