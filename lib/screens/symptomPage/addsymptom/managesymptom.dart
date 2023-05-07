import 'package:flutter/material.dart';
import '../../../service/symptom.dart';

class SelectSymptom extends StatefulWidget {
  const SelectSymptom({
    super.key,
  });

  @override
  State<SelectSymptom> createState() => _SelectSymptomState();
}

class _SelectSymptomState extends State<SelectSymptom> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Visibility(
          visible: selectedSymp.isEmpty ? false : true,
          child: Container(
            height: size.height * 0.3,
            width: size.width,
            margin: const EdgeInsets.symmetric(horizontal: 11, vertical: 23),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3.5,
                crossAxisSpacing: 12,
                mainAxisSpacing: 23,
              ),
              itemCount: selectedSymp.length,
              itemBuilder: (context, index) {
                return ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(width: 1, color: Colors.white),
                    backgroundColor: const Color.fromRGBO(63, 82, 130, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      removeSelected(selectedSymp[index]);
                    });
                  },
                  icon: Image.asset(
                    '../../../assets/images/del.png',
                    width: 26,
                    height: 26,
                  ),
                  label: Text(
                    selectedSymp[index].title,
                    style: const TextStyle(fontFamily: 'Inter', fontSize: 14),
                  ),
                );
              },
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 11, vertical: 23),
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                side: const BorderSide(width: 1, color: Colors.white),
                backgroundColor: const Color.fromRGBO(63, 82, 130, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                minimumSize: Size(size.width, 55)),
            onPressed: () {
              Navigator.of(context)
                  .pushNamed('/searchsymptom')
                  .then((value) => setState(() {}));
            },
            icon: Image.asset(
              '../../../assets/images/add.png',
              width: 26,
              height: 26,
            ),
            label: const Text(
              "Add symptoms",
              style: TextStyle(fontFamily: 'Inter', fontSize: 14),
            ),
          ),
        )
      ],
    );
  }
}
