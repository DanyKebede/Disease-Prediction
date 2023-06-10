import 'package:finalyearproject/screens/firstaidPage/firstaid.dart';
import 'package:finalyearproject/screens/medicalPage/medicalinformation.dart';
import 'package:finalyearproject/screens/result/doctorpage.dart';
import 'package:finalyearproject/screens/result/getdirectionpage.dart';
import 'package:finalyearproject/screens/result/resultpage.dart';
import 'package:finalyearproject/screens/result/showdetail.dart';
import 'package:finalyearproject/screens/symptomPage/addsymptom/addsymptom.dart';
import 'package:finalyearproject/screens/symptomPage/addsymptom/searchsymptom.dart';
import 'package:finalyearproject/screens/symptomPage/symptom.dart';
import 'package:finalyearproject/service/disease.dart';
import 'package:finalyearproject/service/diseasedescription.dart';
import 'package:finalyearproject/service/doctor.dart';
import 'package:finalyearproject/service/firstaid.dart';
import 'package:finalyearproject/service/hospital.dart';
import 'package:finalyearproject/service/symptom.dart';
import 'package:provider/provider.dart';

import './screens/homePage/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './screens/IntroductionPage/introduction.dart';
import 'screens/doctorPage/doctorpage.dart';
import 'screens/firstaidPage/firstaiddetail.dart';
import 'screens/hospitalPage/hospitalpage.dart';
import 'screens/medicalPage/medicaldetail.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DoctorProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HospitalProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DiseaseProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FirstAidProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SymptomProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DiseaseDescriptionProvider(),
        )
      ],
      child: MaterialApp(
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
          '/getdirection': (context) => const GetDirectionPage(),
          '/doctorpage': (context) => const DoctorsPage(),
          '/hospitalpage': (context) => const HospitalsPage(),
          '/medicalpage': (context) => const DiseasePage(),
          '/diseasedetailpage': (context) => const DiseaseDetailPage(),
          '/firstaidpage': (context) => const FirstAidPage(),
          '/firstaiddetailpage': (context) => const FistAidDetailPage()
        },
      ),
    );
  }
}
