import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_info/app/modules/vehicle_profile/vehicle_number.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Vehicle Info",
      initialRoute: AppPages.initial,
      // home: const VehicleNumber(),
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
