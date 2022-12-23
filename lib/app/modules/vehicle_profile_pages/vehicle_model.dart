import 'package:flutter/material.dart';
import '../../widgets/vehicle_detail_tile.dart';
import 'package:get/route_manager.dart';
import 'vehicle_fuel_type.dart';

class VehicleModel extends StatefulWidget {
  final String numController;
  const VehicleModel({Key? key,required this.numController}) : super(key: key);

  @override
  State<VehicleModel> createState() => _VehicleModelState();
}

class _VehicleModelState extends State<VehicleModel> {
  final _data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Select Model"),
          backgroundColor: Colors.deepPurple,
          elevation: 0,
          titleSpacing: 0,
        ),
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) => InkWell(
            onTap: () => Get.to(
              () =>  VehicleFuelType(numController: widget.numController),
              arguments: [_data, "Virtus"],
            ),
            child: const VehicleDetialTile(name: "Tiago"),
          ),
        )
        // : const Center(
        //     child: CircularProgressIndicator(),
        //   ),
        );
  }
}
