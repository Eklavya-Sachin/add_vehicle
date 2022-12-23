import '../../widgets/vehicle_detail_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'vehicle_model.dart';

class VehicleBrandCar extends StatefulWidget {
  final String numController;
  const VehicleBrandCar({Key? key, required this.numController})
      : super(key: key);

  @override
  State<VehicleBrandCar> createState() => _VehicleBrandCarState();
}

class _VehicleBrandCarState extends State<VehicleBrandCar> {
  List? carResponseList;

  @override
  void initState() {
    _carApi();
    super.initState();
  }

  Future _carApi() async {
    final carResponse = await GetConnect()
        .get("https://test.turbocare.app/turbo/care/v1/makes?class=4w");
    setState(() {
      carResponseList = carResponse.body;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Brand"),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        titleSpacing: 0,
      ),
      body: carResponseList != null
          ? ListView.builder(
              itemCount: carResponseList?.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () => Get.to(
                  () =>  VehicleModel(numController: widget.numController),
                  arguments: [carResponseList?[index]],
                ),
                child: VehicleDetialTile(
                  name: carResponseList?[index] ?? "NA",
                ),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
