import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VehicleTile extends StatelessWidget {
  final String vehicleNum;
  final String vehicleCompany;

  const VehicleTile({
    Key? key,
    required this.vehicleNum,
    required this.vehicleCompany,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(
              vehicleNum,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          subtitle: Text(
            vehicleCompany,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade800,
              fontSize: 18,
            ),
          ),
          trailing: IconButton(
            onPressed: () => Get.to(() {}),
            icon: const Icon(Icons.arrow_forward_ios),
          ),
        ),
        Container(
          height: 1,
          color: Colors.grey.shade200,
          margin: const EdgeInsets.symmetric(horizontal: 20),
        ),
      ],
    );
  }
}
