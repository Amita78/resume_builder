import 'package:flutter/material.dart';

class EducationModel {
  TextEditingController course;
  TextEditingController college;
  TextEditingController grade;
  TextEditingController year;

  EducationModel({
    required this.course,
    required this.college,
    required this.grade,
    required this.year,
  });
}
