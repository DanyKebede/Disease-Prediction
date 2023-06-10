import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/hospital.dart';

List<HospitalModel> hospitalData = const [
  HospitalModel(
    id: 1,
    name: "Dream Care General Hospital",
    phone: "0977777777",
    imgurl: "",
    email: "dreamcarehospital@gmail.com",
    hours: 24,
    rating: 4.2,
    lat: 11.5789704,
    lng: 37.3743872,
  ),
  HospitalModel(
    id: 2,
    name: "Tibebe Ghion",
    phone: "0900000000",
    imgurl: "",
    email: "tibebe@gmail.com",
    hours: 24,
    rating: 4.5,
    lat: 11.574208016611124,
    lng: 37.3613587041542,
  ),
  HospitalModel(
    id: 3,
    name: "Felege Hiwot Hospital",
    phone: "0909090909",
    imgurl: "",
    email: "felege@gmail.com",
    hours: 24,
    rating: 3.6,
    lat: 11.607432654571513,
    lng: 37.370369037029654,
  )
];

const baseUrl = 'http://10.0.2.2:8000/';

class HospitalProvider extends ChangeNotifier {
  List<dynamic> hospitaldata = [];
  List<dynamic> searchResult = [];

  Future<void> loadHospitals() async {
    try {
      final hospitals = await fetchHospitals();
      hospitaldata = hospitals;
      searchResult = hospitals;
    } catch (e) {
      if (kDebugMode) {
        print('Error loading Hospital: $e');
      }
    }
    notifyListeners();
  }

  Future<dynamic> fetchHospitalById(int id) async {
    final hospitaldata =
        await http.get(Uri.parse('http://10.0.2.2:8000/hospitals/$id'));
    final data = await json.decode(hospitaldata.body);
    return HospitalModel.fromJson(data);
  }

  Future<List<dynamic>> fetchHospitals() async {
    final hospitaldata = await http.get(Uri.parse('${baseUrl}hospitals/'));
    final List<dynamic> data = await json.decode(hospitaldata.body);

    return data.map((json) => HospitalModel.fromJson(json)).toList();
  }

  search(val) {
    if (val == '') {
      searchResult = hospitaldata;
    } else {
      searchResult = hospitaldata
          .where((element) =>
              element.name.toLowerCase().contains(val.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
