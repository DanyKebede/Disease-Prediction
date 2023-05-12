import 'package:finalyearproject/models/hospital.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

import '../../common/mydrawer.dart';

class GetDirectionPage extends StatelessWidget {
  const GetDirectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final hospitaldata =
        ModalRoute.of(context)!.settings.arguments as HospitalModel;
    LatLng point = LatLng(hospitaldata.lat, hospitaldata.lng);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(46, 67, 120, 1),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Symptom Checker",
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      endDrawer: draw(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 17),
                height: size.height * 0.4,
                width: size.width,
                child: Stack(
                  children: [
                    FlutterMap(
                      options:
                          MapOptions(center: point, zoom: 15.0, maxZoom: 18),
                      children: [
                        TileLayer(
                          urlTemplate:
                              "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                          subdomains: const ['a', 'b', 'c'],
                        ),
                        MarkerLayer(
                          markers: [
                            Marker(
                              width: 100,
                              height: 100,
                              point: point,
                              builder: (context) => const Icon(
                                Icons.location_on,
                                color: Colors.red,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
              padding: const EdgeInsets.only(top: 10, bottom: 30),
              width: size.width,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(63, 82, 130, 1),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 11),
                    child: Text(
                      'Hospital Information',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Divider(
                    height: 2,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  hospitalInformation('../../../assets/images/placeholder.png',
                      hospitaldata.location),
                  hospitalInformation(
                      '../../../assets/images/mail.png', hospitaldata.email),
                  hospitalInformation(
                      '../../../assets/images/phone.png', hospitaldata.phone),
                  hospitalInformation('../../../assets/images/clock.png',
                      '${hospitaldata.hours}hr/day'),
                  Center(
                      child: Container(
                    margin: const EdgeInsets.only(top: 45),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(28, 44, 85, 1),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          minimumSize:
                              Size(MediaQuery.of(context).size.width * 0.7, 56),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed("/symptom");
                        },
                        child: const Text(
                          "Start New Check up",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'SfPro',
                          ),
                        )),
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget hospitalInformation(String img, String s) {
  return ListTile(
    leading: Image.asset(
      img,
      width: 35,
      height: 35,
    ),
    title: Text(
      s,
      style: const TextStyle(
        fontFamily: 'Inter',
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
  );
}
