import 'package:finalyearproject/common/mydrawer.dart';
import 'package:finalyearproject/models/diseasemodel.dart';
import 'package:flutter/material.dart';

class DiseaseDetailPage extends StatelessWidget {
  const DiseaseDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    DiseasesModel d =
        ModalRoute.of(context)!.settings.arguments as DiseasesModel;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(46, 67, 120, 1),
          elevation: 1,
          centerTitle: true,
          title: Text(
            d.name,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        endDrawer: draw(context),
        body: DefaultTabController(
          length: 4,
          child: Column(
            children: [
              const TabBar(
                labelColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 4,
                      color: Color.fromRGBO(161, 96, 96, 1),
                    ),
                  ),
                ),
                tabs: [
                  Tab(
                    child: FittedBox(
                      child: Text(
                        'Overview',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Tab(
                    child: FittedBox(
                      child: Text(
                        'Symptoms',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Tab(
                    child: FittedBox(
                      child: Text(
                        'Causes',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Tab(
                    child: FittedBox(
                      child: Text(
                        'Diagnosis',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    // Overview tab content
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            d.overview[0],
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontFamily: 'OpenSans',
                              // adjust this value as needed
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Diagnosis tab content
                    ListItems(d: d.symptoms),
                    // Causes tab content
                    ListItems(d: d.causes),
                    // Symptoms tab content
                    ListItems(d: d.diagnosis),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListItems extends StatelessWidget {
  const ListItems({
    super.key,
    required this.d,
  });

  final List d;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: d
              .map((e) => Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: Card(
                      color: const Color.fromRGBO(46, 67, 120, 1),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 5),
                            child: const Icon(
                              Icons.forward,
                              color: Color.fromARGB(255, 255, 255, 255),
                              size: 15,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Flexible(
                            child: Text(
                              e,
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontFamily: 'OpenSans'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
