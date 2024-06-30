import 'package:flutter/material.dart';

class ProjectModel {
  TextEditingController title;
  TextEditingController description;

  ProjectModel(
      {
        required this.title,
        required this.description
      });
}
