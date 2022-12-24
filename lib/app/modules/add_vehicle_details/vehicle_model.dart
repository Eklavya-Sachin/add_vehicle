import '../../widgets/vehicle_detail_tile.dart';
import 'package:get/get_connect/connect.dart';
import 'package:get/route_manager.dart';
import 'package:flutter/material.dart';
import 'vehicle_fuel_type.dart';

class VehicleModels extends StatefulWidget {
  final String numController;
  const VehicleModels({Key? key, required this.numController}) : super(key: key);

  @override
  State<VehicleModels> createState() => _VehicleModelsState();
}

class _VehicleModelsState extends State<VehicleModels> {
  final _data = Get.arguments;
  List? vehicleModelResponseList;

  @override
  void initState() {
    _bikeApi();
    super.initState();
  }

  Future _bikeApi() async {
    final vehicleModelResponse = await GetConnect().get(
        "https://test.turbocare.app/turbo/care/v1/models?class=2w&make=honda");
    setState(() {
      vehicleModelResponseList = vehicleModelResponse.body;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Model"),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        titleSpacing: 0,
      ),
      body: vehicleModelResponseList != null
          ? ListView.builder(
              itemCount: vehicleModelResponseList?.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () => Get.to(
                  () => VehicleFuelType(numController: widget.numController),
                  arguments: [_data, vehicleModelResponseList?[index]],
                ),
                child:
                    VehicleDetialTile(name: vehicleModelResponseList?[index]),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
