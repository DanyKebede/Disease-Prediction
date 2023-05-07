import '../models/sympmodel.dart';

List<SympModel> sympdata = [
  SympModel(title: 'Headache', type: 'a'),
  SympModel(title: 'pain', type: 'a'),
  SympModel(title: 'Abdomen', type: 'a'),
  SympModel(title: 'Neck pain', type: 'b'),
  SympModel(title: 'Stomach', type: 'b'),
  SympModel(title: 'Reproductive pain', type: 'b'),
];

List<SympModel> selectedSymp = [];

addtoSelected(SympModel symp) {
  if (!selectedSymp.contains(symp)) {
    selectedSymp.add(symp);
  }
}

removeSelected(symp) {
  if (selectedSymp.contains(symp)) {
    selectedSymp.remove(symp);
  }
}
