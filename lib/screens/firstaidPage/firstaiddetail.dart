import 'package:finalyearproject/common/mydrawer.dart';
import 'package:finalyearproject/models/firstaidmodel.dart';
import 'package:flutter/material.dart';

class FistAidDetailPage extends StatelessWidget {
  const FistAidDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    FirstAidModel d =
        ModalRoute.of(context)!.settings.arguments as FirstAidModel;
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
          length: 2,
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
                        'Points to Consider',
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
                        'Action To Take',
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
                    ListItems(d: d.overview),
                    // Diagnosis tab content
                    ListItems(d: d.actions),
                    // Causes tab content
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
