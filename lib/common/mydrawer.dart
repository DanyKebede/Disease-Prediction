import 'package:flutter/material.dart';
import '../service/menu.dart';

Widget draw(context) {
  return Drawer(
    backgroundColor: const Color.fromRGBO(46, 67, 120, 1),
    child: Column(
      children: menuData
          .map((e) => Card(
                elevation: 0,
                color: const Color.fromRGBO(46, 67, 120, 1),
                child: ListTile(
                  title: Text(
                    e.title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Inter'),
                  ),
                  leading: Image.asset(
                    e.imgUrl,
                    width: 40,
                    height: 40,
                  ),
                  onTap: () {
                    if (e.title == 'Symptom Checker') {
                      Navigator.of(context)
                          .popUntil(ModalRoute.withName('/home'));
                      Navigator.of(context).pushNamed('/symptom');
                    } else if (e.title == 'Doctors') {
                      Navigator.of(context)
                          .popUntil(ModalRoute.withName('/home'));
                      Navigator.of(context).pushNamed('/doctorpage');
                    } else if (e.title == 'Hospitals') {
                      Navigator.of(context)
                          .popUntil(ModalRoute.withName('/home'));
                      Navigator.of(context).pushNamed('/hospitalpage');
                    } else if (e.title == 'Medical Information') {
                      Navigator.of(context)
                          .popUntil(ModalRoute.withName('/home'));
                      Navigator.of(context).pushNamed('/medicalpage');
                    } else if (e.title == 'First aid') {
                      Navigator.of(context)
                          .popUntil(ModalRoute.withName('/home'));
                      Navigator.of(context).pushNamed('/firstaidpage');
                    }
                    // Medical Information
                    // hospitalpage
                    // firstaidpage
                  },
                ),
              ))
          .toList(),
    ),
  );
}
