import 'package:finalyearproject/common/mydrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../service/hospital.dart';
// import '../../service/Hospital.dart';

class HospitalsPage extends StatefulWidget {
  const HospitalsPage({super.key});

  @override
  State<HospitalsPage> createState() => _HospitalsPageState();
}

class _HospitalsPageState extends State<HospitalsPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<HospitalProvider>(context, listen: false).loadHospitals();
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> d = Provider.of<HospitalProvider>(context).searchResult;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(63, 82, 130, 1),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(63, 82, 130, 1),
          elevation: 1,
          centerTitle: true,
          title: const Text(
            "Hospitals List",
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        endDrawer: draw(context),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 17),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                onChanged: (value) =>
                    Provider.of<HospitalProvider>(context, listen: false)
                        .search(value),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromRGBO(46, 67, 120, 1),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Ex. Dream Care General",
                  hintStyle: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 15,
                      color: Color.fromRGBO(198, 185, 185, 1)),
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: d.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 3,
                      margin: const EdgeInsets.only(
                        top: 7,
                        left: 2,
                        right: 2,
                      ),
                      color: const Color.fromRGBO(46, 67, 120, 1),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            '/getdirection',
                            arguments: d[index].id,
                          );
                        },
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
                                  child: d[index].imgurl != ''
                                      ? Image.network(
                                          d[index].imgurl,
                                          fit: BoxFit.cover,
                                          width: 90,
                                          height: 90,
                                        )
                                      : Image.asset(
                                          'assets/images/hospital.png',
                                          fit: BoxFit.cover,
                                          width: 50,
                                          height: 50,
                                        ),
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            '${d[index].name} Hospital',
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Row(
                            children: [
                              Text(
                                d[index].rating.toString(),
                                style: const TextStyle(
                                  color: Color.fromRGBO(201, 197, 197, 1),
                                  fontSize: 12,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 15,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
