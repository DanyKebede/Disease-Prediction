import 'package:flutter/material.dart';

import '../../common/mydrawer.dart';
import '../../service/doctor.dart';

class DoctorPage extends StatelessWidget {
  const DoctorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final index = 0;
    final index = ModalRoute.of(context)!.settings.arguments as int;
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
      endDrawer: draw(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 2,
                          color: const Color.fromRGBO(191, 181, 255, 1)),
                      shape: BoxShape.circle,
                    ),
                    width: 150,
                    height: 150,
                    child: CircleAvatar(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: ClipOval(
                          child: Image.network(
                            doctorData[index].imgurl,
                            fit: BoxFit.cover,
                            width: 140,
                            height: 140,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    doctorData[index].title + doctorData[index].name,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    doctorData[index].email,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 11,
                      color: Color.fromRGBO(201, 197, 197, 1),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    doctorData[index].speciality,
                    style: const TextStyle(
                        color: Color.fromRGBO(201, 197, 197, 1),
                        fontSize: 13,
                        fontFamily: 'Inter'),
                  ),
                  Column(
                    children: doctorData[index]
                        .hospital
                        .map((e) => Text(
                              e,
                              style: const TextStyle(
                                  color: Color.fromRGBO(201, 197, 197, 1),
                                  fontSize: 13,
                                  fontFamily: 'Inter'),
                            ))
                        .toList(),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 55,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text.rich(
                              TextSpan(
                                style: const TextStyle(
                                    fontFamily: 'Inter', color: Colors.white),
                                children: [
                                  TextSpan(
                                      text: '${doctorData[index].hours}',
                                      style: const TextStyle(fontSize: 16)),
                                  const TextSpan(
                                      text: 'hr/day',
                                      style: TextStyle(
                                        fontSize: 12,
                                      )),
                                ],
                              ),
                            ),
                            const Text(
                              'Available',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w300,
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text.rich(
                              TextSpan(
                                style: const TextStyle(
                                    fontFamily: 'Inter', color: Colors.white),
                                children: [
                                  TextSpan(
                                      text: '${doctorData[index].experiance}',
                                      style: const TextStyle(fontSize: 16)),
                                  const TextSpan(
                                      text: ' years',
                                      style: TextStyle(
                                        fontSize: 12,
                                      )),
                                ],
                              ),
                            ),
                            const Text(
                              'Experiance',
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              doctorData[index].rating.toString(),
                              style: const TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 13,
                                  color: Colors.white),
                            ),
                            const Text(
                              'Rating',
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
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
                      'Personal Information',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  const Divider(
                    height: 2,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  personalInformation('../../../assets/images/suitcase.png',
                      doctorData[index].hospital[0]),
                  personalInformation('../../../assets/images/mail.png',
                      doctorData[index].email),
                  personalInformation('../../../assets/images/phone.png',
                      doctorData[index].phone),
                  personalInformation('../../../assets/images/clock.png',
                      '${doctorData[index].hours}hr/day'),
                  doctorData[index].link != null
                      ? personalInformation(
                          '../../../assets/images/linkedin.png',
                          doctorData[index].link!)
                      : const Text(''),
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
                        onPressed: () {},
                        child: const Text(
                          "Get Direction",
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

Widget personalInformation(String img, String s) {
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
