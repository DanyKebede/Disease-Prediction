import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'intro.dart';
import 'introdata.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({super.key});

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  var controller = PageController();
  var lastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.center,
          colors: [
            Color.fromRGBO(97, 132, 223, 1),
            Color.fromRGBO(47, 67, 120, 1),
          ],
        )),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.75,
              child: PageView(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    lastPage = value == (data.length - 1);
                  });
                },
                children: data
                    .map(
                      (data) => Intro(
                        title: data.title,
                        subtitle: data.description,
                        url: data.imgUrl,
                      ),
                    )
                    .toList(),
              ),
            ),
            SmoothPageIndicator(
              controller: controller,
              count: data.length,
              effect: const SlideEffect(
                  spacing: 15.0, activeDotColor: Colors.white),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.05),
              child: lastPage
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          fixedSize: Size(
                              MediaQuery.of(context).size.width * 0.5, 50)),
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/home');
                      },
                      child: const Text(
                        "Get Started",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SfPro',
                        ),
                      ))
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          minimumSize: const Size(70, 70)),
                      onPressed: () {
                        controller.nextPage(
                            duration: const Duration(microseconds: 500),
                            curve: Curves.easeInOut);
                      },
                      child: const Icon(
                        Icons.arrow_forward,
                        size: 30,
                      )),
            )
          ],
        ),
      ),
    );
  }
}
