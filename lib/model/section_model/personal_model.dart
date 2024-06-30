import 'package:flutter/material.dart';

class PersonalModel {
  TextEditingController name;
  TextEditingController position;
  TextEditingController address;
  TextEditingController email;
  TextEditingController phone;

  PersonalModel({
    required this.name,
    required this.position,
    required this.address,
    required this.email,
    required this.phone,
  });
}
