import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resume_builder/controller/controller.dart';
import 'package:resume_builder/model/section_model/education_model.dart';
import 'package:resume_builder/widgets/text_field.dart';

class EducationScreen extends StatelessWidget {
   EducationScreen({super.key});

  final homeCtrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Education'),
      ),
      body: Obx(
        () => (homeCtrl.educationItems.value.isEmpty)
            ? const Center(
                child: Image(image: AssetImage('assets/images/data.png',),),
              )
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(bottom: 60),
                itemCount: homeCtrl.educationItems.value.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      itemContainer(index, homeCtrl.educationItems.value[index]),
                      const Divider(),
                      const SizedBox(height: 5),
                    ],
                  );
                },
              ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                homeCtrl.educationItems.value.add(EducationModel(
                  course: TextEditingController(),
                  college: TextEditingController(),
                  grade: TextEditingController(),
                  year: TextEditingController(),
                ));
                homeCtrl.educationItems.refresh();
              },
              child: const Text('Add'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.back();
                //homeCtrl.addEducationToHive();
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemContainer(int index, EducationModel educationModel) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Education ${index + 1}',
                style: const TextStyle(fontSize: 18),
              ),
              IconButton(onPressed: () {
                homeCtrl.removeEducationItem(index);
              }, icon: const Icon(Icons.delete))
            ],
          ),
          DataField(
            label: 'Course/Degree',
            type: TextInputType.text,
            height: 70,
            controller: educationModel.course,
          ),
          DataField(
            label: 'School/University',
            type: TextInputType.text,
            height: 70,
            controller: educationModel.college,
          ),
          DataField(
            label: 'Grade/Score',
            type: TextInputType.text,
            height: 70,
            controller: educationModel.grade,
          ),
          DataField(
            label: 'Year',
            type: TextInputType.number,
            height: 70,
            controller: educationModel.year,
          ),
        ],
      ),
    );
  }
}
