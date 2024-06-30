import 'package:flutter/material.dart';
class ReferenceModel{

  TextEditingController referee;
  TextEditingController jobTitle;
  TextEditingController company;
  TextEditingController email;
  TextEditingController phone;

  ReferenceModel({required this.referee,required this.jobTitle,required this.company,required this.email,required this.phone});

  Map<String, dynamic> toJson()
  {
    final data = <String, dynamic>{};
    data['referee'] = referee;
    data['jobTitle'] = jobTitle;
    data['company'] = company;
    data['email'] = email;
    data['phone'] = phone;
    return data;
  }

}