import 'package:path_provider/path_provider.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter/material.dart';
import 'app/routes/app_pages.dart';
import 'app/data/vehicle_model.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final document = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(document.path);
  Hive.registerAdapter(VehicleModelAdapter());
  await Hive.openBox("vehicle");

  runApp(
    GetMaterialApp(
      title: "Vehicle Info",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
