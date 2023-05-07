import 'package:finalyearproject/screens/result/doctorpage.dart';
import 'package:finalyearproject/screens/result/resultpage.dart';
import 'package:finalyearproject/screens/result/showdetail.dart';
import 'package:finalyearproject/screens/symptomPage/addsymptom/addsymptom.dart';
import 'package:finalyearproject/screens/symptomPage/addsymptom/searchsymptom.dart';
import 'package:finalyearproject/screens/symptomPage/symptom.dart';

import './screens/homePage/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './screens/IntroductionPage/introduction.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(46, 67, 120, 1),
        textTheme: const TextTheme(
          titleMedium: TextStyle(color: Colors.white, fontFamily: 'Inter'),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const IntroductionPage(),
      routes: {
        '/home': (context) => const HomePage(),
        '/symptom': (context) => const SymptomPage(),
        '/addsymptom': (context) => const AddSymptomPage(),
        '/searchsymptom': (context) => const SearchSymptoms(),
        '/result': (context) => const ResultPage(),
        '/detail': (context) => const ShowDetailPage(),
        '/doctor': (context) => const DoctorPage(),
      },
    );
  }
}
