import 'package:flutter/material.dart';

class AgeSlider extends StatefulWidget {
  const AgeSlider({super.key});

  @override
  State<AgeSlider> createState() => _AgeSliderState();
}

class _AgeSliderState extends State<AgeSlider> {
  double currentValue = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          currentValue.toInt().toString(),
          style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.bold),
        ),
        Slider(
            value: currentValue,
            label: currentValue.toInt().toString(),
            inactiveColor: Colors.white,
            min: 0,
            max: 130,
            onChanged: (value) {
              setState(() {
                currentValue = value;
              });
            }),
      ],
    );
  }
}
