import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../service/symptom.dart';

class SearchSymptoms extends StatefulWidget {
  const SearchSymptoms({super.key});

  @override
  State<SearchSymptoms> createState() => _SearchSymptomsState();
}

class _SearchSymptomsState extends State<SearchSymptoms> {
  List sym = [];

  search(val, context) {
    setState(() {
      if (val == '') {
        sym.clear();
      } else {
        List sympdata =
            Provider.of<SymptomProvider>(context, listen: false).sympdata;
        sym = sympdata
            .where(
                (element) => element.toLowerCase().contains(val.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(63, 82, 130, 1),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(63, 82, 130, 1),
          elevation: 1,
          automaticallyImplyLeading: false,
          title: const Text(
            "Search",
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close),
            )
          ],
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 17),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                onChanged: (value) => search(value, context),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromRGBO(46, 67, 120, 1),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Ex. Headache",
                  hintStyle: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 15,
                      color: Color.fromRGBO(198, 185, 185, 1)),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: sym.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Provider.of<SymptomProvider>(context, listen: false)
                            .addtoSelected(sym[index]);
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: Text(
                          sym[index],
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 20,
                            color: Colors.black,
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
