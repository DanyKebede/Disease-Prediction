import 'package:finalyearproject/screens/homePage/homegrid.dart';
import 'package:flutter/material.dart';

import '../../common/mydrawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(46, 67, 120, 1),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          "Medical App",
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      endDrawer: draw(context),
      body: HomeGrid(),
    );
  }
}
