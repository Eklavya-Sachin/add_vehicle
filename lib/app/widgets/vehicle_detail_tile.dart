import 'package:flutter/material.dart';

class VehicleDetialTile extends StatelessWidget {
  final String name;

  const VehicleDetialTile({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: ListTile(
        title: Text(
          name,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black87,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
        ),
      ),
    );
  }
}
