import 'package:finalyearproject/service/symptom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/mydrawer.dart';
import '../../service/disease.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final predicted = Provider.of<SymptomProvider>(
      context,
    ).predictedDisease;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(46, 67, 120, 1),
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Result Screen",
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        endDrawer: draw(context),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              padding: const EdgeInsets.symmetric(vertical: 5),
              height: 60,
              width: size.width,
              color: status[0].mycolor,
              child: Image.asset(
                status[0].imgUrl,
                width: 60,
                height: 60,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 14),
              padding: const EdgeInsets.only(
                  right: 11, left: 11, top: 10, bottom: 30),
              width: size.width,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(63, 82, 130, 1),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    status[0].title,
                    style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    status[0].description,
                    style: const TextStyle(
                        fontFamily: 'Inter', fontSize: 15, color: Colors.white),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
              padding: const EdgeInsets.only(top: 10, bottom: 30),
              width: size.width,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(63, 82, 130, 1),
                borderRadius: BorderRadius.circular(5),
              ),
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 11),
                      child: Text(
                        'Possible condition',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Divider(
                      height: 4,
                      color: Colors.black,
                    ),
                    Card(
                      margin: const EdgeInsets.only(top: 7, left: 2, right: 2),
                      color: const Color.fromRGBO(46, 67, 120, 1),
                      child: ListTile(
                        title: Text(
                          predicted.predictedDisease,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        trailing: Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextButton.icon(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed('/detail', arguments: predicted);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                size: 15,
                                color: Color.fromARGB(255, 148, 145, 145),
                              ),
                              label: const Text(
                                'Show details',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 12,
                                  color: Colors.white,
                                  decoration: TextDecoration.underline,
                                ),
                              )),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 11, top: 10),
                      child: Text(
                        'Confidence Score',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Divider(
                      height: 4,
                      color: Colors.black,
                    ),
                    Card(
                      margin: const EdgeInsets.only(top: 7, left: 2, right: 2),
                      color: const Color.fromRGBO(46, 67, 120, 1),
                      child: ListTile(
                        title: Text(
                          '${predicted.confidenceScore} %',
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 11, top: 10),
                      child: Text(
                        'Speciality Required',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Divider(
                      height: 4,
                      color: Colors.black,
                    ),
                    Card(
                      margin: const EdgeInsets.only(top: 7, left: 2, right: 2),
                      color: const Color.fromRGBO(46, 67, 120, 1),
                      child: ListTile(
                        title: Text(
                          predicted.speciality,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(28, 44, 85, 1),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * 0.7, 56),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed("/symptom");
                    },
                    child: const Text(
                      "Start New Check up",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SfPro',
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
