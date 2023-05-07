import 'package:flutter/material.dart';
import '../../models/menu.dart';

class HomeGrid extends StatelessWidget {
  HomeGrid({super.key});

  final List<Menu> menuData = [
    Menu(
      title: 'Symptom Checker',
      imgUrl: '../../../assets/images/symptomchecker.png',
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
      imgUrl: '../../../assets/images/medRecord.png',
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
      imgUrl: '../../../assets/images/hospital.png',
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
      imgUrl: '../../../assets/images/medicaldoc.png',
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
      imgUrl: '../../../assets/images/first-aid-box.png',
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
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(14),
      child: GridView.builder(
        itemCount: menuData.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 28.0,
            mainAxisSpacing: 34.0,
            childAspectRatio: 1.2),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () => {
              if (index == 0) {Navigator.of(context).pushNamed('/symptom')}
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: menuData[index].boxColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    menuData[index].imgUrl,
                    width: 70,
                    height: 70,
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  Text(
                    menuData[index].title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Inter'),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
