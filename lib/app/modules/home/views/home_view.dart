import '../../vehicle_profile_pages/vehicle_number.dart';
import '../controllers/home_controller.dart';
import '../../../widgets/vehicle_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => await Get.defaultDialog(
        title: "Exit the app!",
        content: const Text("Are you sure you want to exit?"),
        actions: [
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepPurple)),
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: const Text("Confirm"),
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepPurple)),
            onPressed: () => Get.back(),
            child: const Text("Cancel"),
          ),
        ],
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Text('Vehicles'),
          titleSpacing: 20,
          elevation: 0,
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => const VehicleTile(
            vehicleNum: "DL3SAU1404",
            vehicleCompany: "Maruti Suzuki Dzire",
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          onPressed: () => Get.to(() => const VehicleNumber()),
          child: const Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
