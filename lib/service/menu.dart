import '../models/menu.dart';
import 'package:flutter/material.dart';

final List<Menu> menuData = [
  Menu(
    title: 'Symptom Checker',
    imgUrl: 'assets/images/symptomchecker.png',
    boxColor: const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color.fromRGBO(248, 13, 253, 0.25),
        Color.fromRGBO(79, 68, 200, 1),
      ],
    ),
  ),
  Menu(
    title: 'Medical Information',
    imgUrl: 'assets/images/medRecord.png',
    boxColor: const LinearGradient(
      begin: Alignment.centerRight,
      end: Alignment.bottomLeft,
      colors: [
        Color.fromRGBO(141, 134, 134, 0.81),
        Color.fromRGBO(161, 96, 96, 1),
      ],
    ),
  ),
  Menu(
    title: 'Hospitals',
    imgUrl: 'assets/images/hospital.png',
    boxColor: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.center,
      colors: [
        Color.fromRGBO(99, 192, 103, 0.19),
        Color.fromRGBO(76, 175, 80, 0.94),
      ],
    ),
  ),
  Menu(
    title: 'Doctors',
    imgUrl: 'assets/images/medicaldoc.png',
    boxColor: const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.center,
      colors: [
        Color.fromRGBO(239, 150, 123, 0.53),
        Color.fromRGBO(255, 87, 34, 1),
      ],
    ),
  ),
  Menu(
    title: 'First aid',
    imgUrl: 'assets/images/first-aid-box.png',
    boxColor: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.center,
      colors: [
        Color.fromRGBO(109, 204, 135, 0.52),
        Color.fromRGBO(76, 163, 245, 1),
      ],
    ),
  ),
];
