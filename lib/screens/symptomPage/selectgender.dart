import 'package:flutter/material.dart';

class GenderSelect extends StatefulWidget {
  const GenderSelect({super.key});

  @override
  State<GenderSelect> createState() => _GenderSelectState();
}

class _GenderSelectState extends State<GenderSelect> {
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isSelected = 1;
            });
          },
          child: genderContainer(
              "Female",
              "../../../assets/images/girl.png",
              context,
              isSelected == 1 ? const Color.fromRGBO(46, 67, 120, 1) : null),
        ),
        InkWell(
          onTap: () {
            setState(() {
              isSelected = 2;
            });
          },
          child: genderContainer(
              "Male",
              "../../../assets/images/man.png",
              context,
              isSelected == 2 ? const Color.fromRGBO(46, 67, 120, 1) : null),
        )
      ],
    );
  }
}

Widget genderContainer(text, imgurl, context, myColor) {
  return Center(
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 9),
      padding: const EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width * 0.6,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.white),
        borderRadius: BorderRadius.circular(5),
        color: myColor,
      ),
      child: Row(
        children: [
          Image.asset(imgurl),
          const SizedBox(
            width: 18,
          ),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Inter',
              fontSize: 20,
            ),
          )
        ],
      ),
    ),
  );
}
