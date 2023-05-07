enum Strength {
  high,
  medium,
  low,
}

class DiseaseModel {
  final String title;
  final String type;
  final String description;
  final Strength level;

  const DiseaseModel({
    required this.level,
    required this.type,
    required this.title,
    required this.description,
  });
}
