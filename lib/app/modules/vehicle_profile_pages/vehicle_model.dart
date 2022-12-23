import 'package:flutter/material.dart';

class VehicleModel extends StatefulWidget {
  const VehicleModel({Key? key}) : super(key: key);

  @override
  State<VehicleModel> createState() => _VehicleModelState();
}

class _VehicleModelState extends State<VehicleModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Model"),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        titleSpacing: 0,
      ),
    );
  }
}
