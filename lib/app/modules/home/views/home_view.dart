// ignore_for_file: prefer_const_constructors
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vehicle_info/app/modules/home/views/vehicle_detail.dart';
import '../../../data/vehicle_model.dart';
import '../../add_vehicle_details/vehicle_number.dart';
import '../controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final Box vehicleBox = Hive.box("vehicle");

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
        body: vehicleBox.isNotEmpty
            ? cusListViewBuilder()
            : Center(
                child: Text("Add Vehicle to your list"),
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

  Widget cusListViewBuilder() {
    return WatchBoxBuilder(
      box: Hive.box("vehicle"),
      builder: (context, vehicleBox) {
        return ListView.builder(
          itemCount: vehicleBox.length,
          itemBuilder: (context, index) {
            final vehicle = vehicleBox.getAt(index) as VehicleModel?;
            return InkWell(
              onTap: () => Get.to(() => VehicleProfile(), arguments: vehicle),
              child: Column(
                children: [
                  ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        vehicle?.vehicleNumber ?? "NA",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    subtitle: Text(
                      vehicle?.vehicleBrand ?? "NA",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade800,
                        fontSize: 18,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () => vehicleBox.deleteAt(index),
                      icon: const Icon(
                        Icons.delete,
                      ),
                    ),
                  ),
                  Container(
                    height: 1,
                    color: Colors.grey.shade200,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
