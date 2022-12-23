import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VehicleBrand extends StatefulWidget {
  const VehicleBrand({Key? key}) : super(key: key);

  @override
  State<VehicleBrand> createState() => _VehicleBrandState();
}

class _VehicleBrandState extends State<VehicleBrand> {
  List? bikeResponseList;
  List? carResponseList;

  @override
  void initState() {
    _bikeApi();
    _carApi();
    super.initState();
  }

  Future _bikeApi() async {
    final bikeResponse = await GetConnect()
        .get("https://test.turbocare.app/turbo/care/v1/makes?class=2w");
    setState(() {
      bikeResponseList = bikeResponse.body;
    });
  }

  Future _carApi() async {
    final carResponse = await GetConnect()
        .get("https://test.turbocare.app/turbo/care/v1/makes?class=4w");
    setState(() {
      carResponseList = carResponse.body;
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
      body: ListView.builder(
        itemCount: bikeResponseList?.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListTile(
            title: Text(bikeResponseList?[index] ?? "NA"),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward_ios),
            ),
          ),
        ),
      ),
    );
  }
}
