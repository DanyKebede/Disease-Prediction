import 'package:flutter/material.dart';

import '../../../common/mydrawer.dart';
import './managesymptom.dart';

class AddSymptomPage extends StatelessWidget {
  const AddSymptomPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 17),
        width: size.width,
        height: size.height * 0.85,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(63, 82, 130, 1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 17, horizontal: 12),
              child: const Text(
                "Add your symptoms",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inter',
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: size.width,
              margin: const EdgeInsets.symmetric(horizontal: 12),
              child: const Text(
                "Add as many symptoms as you can for the accurate results. ",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SelectSymptom(),
            // const NewSymptom(),
            const Spacer(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 14),
              padding: const EdgeInsets.only(bottom: 23),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(63, 82, 130, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        minimumSize: Size(size.width * 0.2, 50)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                    label: const Text(
                      "Back",
                      style: TextStyle(fontFamily: 'Inter', fontSize: 14),
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(46, 67, 120, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: Size(size.width * 0.4, 50)),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/result');
                    },
                    child: const Text(
                      "Next",
                      style: TextStyle(fontFamily: 'Inter', fontSize: 16),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
