import 'package:flutter/material.dart';

class VehicleNumber extends StatefulWidget {
  const VehicleNumber({Key? key}) : super(key: key);

  @override
  State<VehicleNumber> createState() => _VehicleNumberState();
}

class _VehicleNumberState extends State<VehicleNumber> {
  final vehicleNumController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Create new vehicle profile"),
          backgroundColor: Colors.deepPurple,
          elevation: 0,
          titleSpacing: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "VEHICLE NUMBER",
                style: TextStyle(fontSize: 17),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                child: TextField(
                  textCapitalization: TextCapitalization.characters,
                  controller: vehicleNumController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple)),
                      hintText: "Enter your Vehicle Number!"),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          onPressed: () {},
          child: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
