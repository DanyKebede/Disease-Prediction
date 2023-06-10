import '../models/doctormodel.dart';

import 'package:flutter/foundation.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

const String baseUrl = 'http://10.0.2.2:8000/';

class DoctorProvider extends ChangeNotifier {
  List<dynamic> doctorData = [];
  List<dynamic> searchResult = [];

  Future<void> loadDoctors() async {
    try {
      final doctors = await fetchDoctors();
      doctorData = doctors;
      searchResult = doctors;
    } catch (e) {
      if (kDebugMode) {
        print('Error loading doctors: $e');
      }
    }
    notifyListeners();
  }

  //Get all Doctors
  Future<List<dynamic>> fetchDoctors() async {
    final doctorData = await http.get(Uri.parse('${baseUrl}doctors/'));
    final List<dynamic> data = await json.decode(doctorData.body);
    return data.map((json) => DoctorModel.fromJson(json)).toList();
  }

  search(val) {
    if (val == '') {
      searchResult = doctorData;
    } else {
      searchResult = doctorData
          .where((element) =>
              element.name.toLowerCase().contains(val.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
