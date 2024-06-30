import 'package:flutter/material.dart';

class DataField extends StatelessWidget {
  String label;
  double height;
  TextInputType type;
  int maxLines;
  TextEditingController? controller;
  DataField({super.key,this.controller,required this.label,required this.type,required this.height,this.maxLines = 1,});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      padding:const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            label: Text(label),
            labelStyle: TextStyle(
                color: Theme.of(context).colorScheme.primary
            )
        ),
        keyboardType:type,
        maxLines: maxLines,
      ),
    );
  }
}
