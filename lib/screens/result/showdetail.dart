import 'package:flutter/material.dart';

import '../../common/mydrawer.dart';
import '../../service/disease.dart';
import '../../service/doctor.dart';

class ShowDetailPage extends StatelessWidget {
  const ShowDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final index = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(46, 67, 120, 1),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Symptom Checker",
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      endDrawer: draw(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 14, right: 14, top: 15),
            padding:
                const EdgeInsets.only(right: 11, left: 11, top: 10, bottom: 30),
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
                  data[index].title,
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
                  data[index].description,
                  style: const TextStyle(
                      fontFamily: 'Inter', fontSize: 15, color: Colors.white),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
            padding: const EdgeInsets.only(top: 10),
            width: size.width,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(63, 82, 130, 1),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 11),
                  child: Text(
                    'Recommended Doctors',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                const Divider(
                  height: 4,
                  color: Colors.black,
                ),
                SizedBox(
                  height: size.height * 0.45,
                  child: ListView.builder(
                    itemCount: doctorData.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.only(
                          top: 7,
                          left: 2,
                          right: 2,
                        ),
                        color: const Color.fromRGBO(46, 67, 120, 1),
                        child: ListTile(
                          leading: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2,
                                  color:
                                      const Color.fromRGBO(191, 181, 255, 1)),
                              shape: BoxShape.circle,
                            ),
                            width: 50,
                            height: 50,
                            child: CircleAvatar(
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: ClipOval(
                                  child: Image.network(
                                    doctorData[index].imgurl,
                                    fit: BoxFit.cover,
                                    width: 90,
                                    height: 90,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            doctorData[index].title + doctorData[index].name,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Text(
                            doctorData[index].speciality,
                            style: const TextStyle(
                              color: Color.fromRGBO(201, 197, 197, 1),
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed('/doctor', arguments: index);
                            },
                            icon: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          Center(
              child: Container(
            margin: const EdgeInsets.only(top: 45),
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
                onPressed: () {},
                child: const Text(
                  "Start New Check up",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SfPro',
                  ),
                )),
          ))
        ],
      ),
    );
  }
}
