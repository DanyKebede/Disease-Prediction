class HospitalModel {
  final int id;
  final String name;
  final String phone;
  final String location;
  final String imgurl;
  final double lat;
  final double lng;
  final double rating;
  final String email;
  final int hours;

  const HospitalModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.imgurl,
    required this.email,
    required this.hours,
    required this.rating,
    required this.lat,
    required this.lng,
    this.location = "Bahir Dar, Ethiopia",
  });
}
