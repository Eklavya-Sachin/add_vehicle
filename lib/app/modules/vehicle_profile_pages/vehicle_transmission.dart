import 'package:flutter/material.dart';

class VehicleTransmission extends StatefulWidget {
  const VehicleTransmission({Key? key}) : super(key: key);

  @override
  State<VehicleTransmission> createState() => _VehicleTransmissionState();
}

class _VehicleTransmissionState extends State<VehicleTransmission> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Transmission"),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        titleSpacing: 0,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              "Manual",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
              ),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: () {},
            ),
          ),
          ListTile(
            title: Text(
              "Automatic",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
              ),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
