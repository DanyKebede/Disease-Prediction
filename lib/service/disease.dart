
import 'package:flutter/material.dart';

import '../models/diseasemodel.dart';
import '../models/statusmodel.dart';

List<DiseaseModel> data = const [
  DiseaseModel(
    type: 'psychological ',
    title: 'Tension',
    description:
        'A tension-type headache (TTH) is generally a mild to moderate pain that\'s often described as feeling like a tight band around the head.',
    level: Strength.low,
  ),
  DiseaseModel(
    type: 'Infectious',
    title: 'common cold',
    description:
        'The common cold is an infection of your nose, sinuses, throat and windpipe. Colds spread easily, especially within homes, classrooms and workplaces. ',
    level: Strength.low,
  ),
  DiseaseModel(
    type: 'psychological',
    title: 'anxiety ',
    description:
        'Anxiety is a feeling of unease, such as worry or fear, that can be mild or severe.Everyone has feelings of anxiety at some point in their life. ',
    level: Strength.medium,
  ),
];

List<StatusModel> status = const [
  StatusModel(
    title: 'Self-care may be enough',
    description:
        'The symptom you have declared may not require medical evaluation and they usually resolve on their own.',
    imgUrl: '../../assets/images/home.png',
    mycolor: Colors.green,
  ),
];
