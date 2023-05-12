import 'package:finalyearproject/models/hospital.dart';

class DoctorModel {
  final int age;
  final List<HospitalModel> hospital;
  final String id;
  final String name;
  final String phone;
  final String speciality;
  final String imgurl;
  final String title;
  final int experiance;
  final double rating;
  final String email;
  final int hours;
  final String? link; // ?

  const DoctorModel({
    required this.age,
    required this.hospital,
    required this.id,
    required this.name,
    required this.phone,
    required this.speciality,
    required this.imgurl,
    required this.title,
    required this.email,
    required this.experiance,
    required this.hours,
    required this.rating,
    this.link,
  });
}
