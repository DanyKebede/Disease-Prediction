import 'package:flutter/material.dart';

class Intro extends StatelessWidget {
  final String title;
  final String subtitle;
  final String url;

  const Intro(
      {required this.title,
      required this.subtitle,
      required this.url,
      super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(
              top: size.height * 0.15, bottom: size.height * 0.07),
          child: Image.asset(url),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          width: size.height * 0.5,
          child: Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Theme.of(context).textTheme.titleMedium?.color,
                    fontFamily: 'Inter',
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 19,
              ),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Theme.of(context).textTheme.titleMedium?.color,
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ],
    );
  }
}
