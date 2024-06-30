import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resume_builder/controller/controller.dart';
import 'package:resume_builder/model/section_model/objective_model.dart';
import '../../widgets/text_field.dart';

class ObjectiveScreen extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
  ObjectiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Objective'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: homeCtrl.objectiveItems.value.length,
          itemBuilder: (BuildContext context, int index) {
            return object(homeCtrl.objectiveItems.value[index]);
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child:
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Save'),
        ),
      ),
    );
  }

  Widget object(ObjectiveModel model) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Objective',
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 18),
          ),
          DataField(
            label: '',
            type: TextInputType.multiline,
            height: 150,
            maxLines: 6,
            controller: model.objective,
          ),
        ],
      ),
    );
  }
}
