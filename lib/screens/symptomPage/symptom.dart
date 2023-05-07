import 'package:finalyearproject/common/mydrawer.dart';
import './ageslider.dart';
import './selectgender.dart';
import 'package:flutter/material.dart';

class SymptomPage extends StatelessWidget {
  const SymptomPage({super.key});

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
      endDrawer: draw(),
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
                "Get Started",
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
                "Health Guidance and Location app  help your medical symptoms, identify illness and suggest appropriate doctors. ",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 17),
                child: const Text(
                  "Select your Age",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const AgeSlider(),
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 17),
                child: const Text(
                  "Select your Gender",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const GenderSelect(),
            Center(
                child: Container(
              margin: const EdgeInsets.only(top: 45),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(46, 67, 120, 1),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.6, 56),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/addsymptom');
                  },
                  child: const Text(
                    "Submit",
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
    );
  }
}
