import 'package:flutter/material.dart';

class ExperienceModel {
  TextEditingController company;
  TextEditingController jobTitle;
  TextEditingController startDate;
  TextEditingController endDate;
  TextEditingController detail;

  ExperienceModel(
      {required this.company,
      required this.jobTitle,
      required this.startDate,
      required this.endDate,
      required this.detail});
}
