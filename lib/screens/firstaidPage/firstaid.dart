import 'package:finalyearproject/common/mydrawer.dart';
import 'package:finalyearproject/service/firstaid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstAidPage extends StatefulWidget {
  const FirstAidPage({super.key});

  @override
  State<FirstAidPage> createState() => _FirstAidPageState();
}

class _FirstAidPageState extends State<FirstAidPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<FirstAidProvider>(context, listen: false).loadFirstAid();
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> d = Provider.of<FirstAidProvider>(context).searchResult;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(63, 82, 130, 1),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(63, 82, 130, 1),
          elevation: 1,
          centerTitle: true,
          title: const Text(
            "First Aid",
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
                    Provider.of<FirstAidProvider>(context, listen: false)
                        .search(value),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromRGBO(46, 67, 120, 1),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Ex. Bleeding",
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
                          Navigator.of(context).pushNamed('/firstaiddetailpage',
                              arguments: d[index]);
                        },
                        child: ListTile(
                          title: Text(
                            '${d[index].name.toUpperCase()}',
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
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
