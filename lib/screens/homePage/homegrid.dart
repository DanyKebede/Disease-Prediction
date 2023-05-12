import 'package:flutter/material.dart';
import '../../service/menu.dart';

class HomeGrid extends StatelessWidget {
  HomeGrid({super.key});

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
