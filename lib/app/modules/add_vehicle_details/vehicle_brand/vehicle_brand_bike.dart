import '../../../widgets/vehicle_detail_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../vehicle_model.dart';

class VehicleBrandBike extends StatefulWidget {
  final String numController;
  const VehicleBrandBike({Key? key, required this.numController})
      : super(key: key);

  @override
  State<VehicleBrandBike> createState() => _VehicleBrandBikeState();
}

class _VehicleBrandBikeState extends State<VehicleBrandBike> {
  List? bikeResponseList;

  @override
  void initState() {
    _bikeApi();
    super.initState();
  }

  Future _bikeApi() async {
    final bikeResponse = await GetConnect()
        .get("https://test.turbocare.app/turbo/care/v1/makes?class=2w");
    setState(() {
      bikeResponseList = bikeResponse.body;
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
      body: bikeResponseList != null
          ? ListView.builder(
              itemCount: bikeResponseList?.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () => Get.to(
                  () =>  VehicleModels(numController: widget.numController),
                  arguments: [bikeResponseList?[index]],
                ),
                child: VehicleDetialTile(
                  name: bikeResponseList?[index] ?? "NA",
                ),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
