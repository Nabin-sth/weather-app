import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';

import '../controller/global_controller.dart';

class Headerwidget extends StatefulWidget {
  const Headerwidget({super.key});

  @override
  State<Headerwidget> createState() => _HeaderwidgetState();
}

class _HeaderwidgetState extends State<Headerwidget> {
  String city = "";
  String date = DateFormat("yMMMMd").format(DateTime.now());

  final Globalcontroller globalcontroller =
      Get.put(Globalcontroller(), permanent: true);

  @override
  void initState() {
    getAddress(globalcontroller.getlatitude().value,
        globalcontroller.getlongitude().value);

    super.initState();
  }

  getAddress(lat, lon) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);
    Placemark place = placemark[0];
    setState(() {
      city = place.locality!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            alignment: Alignment.topLeft,
            child: Text(
              city,
              style: const TextStyle(
                fontSize: 32,
              ),
            )),
        const SizedBox(height: 5),
        Container(
            alignment: Alignment.topLeft,
            child: Text(
              date,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            )),
      ],
    );
  }
}
