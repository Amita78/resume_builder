import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resume_builder/model/section_model/experience_model.dart';

import '../../controller/controller.dart';
import '../../widgets/text_field.dart';

class ExperienceScreen extends StatelessWidget {
   ExperienceScreen({super.key});

  final homeCtrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Experience'),
      ),
      body: Obx(
        () => (homeCtrl.experienceItems.value.isEmpty)
            ? const Center(
          child: Image(image: AssetImage('assets/images/data.png',),),
              )
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(bottom: 60),
                itemCount: homeCtrl.experienceItems.value.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      itemContainer(
                          index, homeCtrl.experienceItems.value[index]),
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
                homeCtrl.experienceItems.value.add(ExperienceModel(
                  company: TextEditingController(),
                  jobTitle: TextEditingController(),
                  startDate: TextEditingController(),
                  endDate: TextEditingController(),
                  detail: TextEditingController(),
                ));
                homeCtrl.experienceItems.refresh();
              },
              child: const Text('Add'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemContainer(int index, ExperienceModel experienceModel) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Experience ${index + 1}',
                style: const TextStyle(fontSize: 18),
              ),
              IconButton(onPressed: () {
                homeCtrl.removeExperienceItem(index);
              }, icon: const Icon(Icons.delete))
            ],
          ),
          DataField(
            label: 'Company Name',
            type: TextInputType.text,
            height: 70,
            controller: experienceModel.company,
          ),
          DataField(
            label: 'Job Title',
            type: TextInputType.text,
            height: 70,
            controller: experienceModel.jobTitle,
          ),
          Row(
            children: [
              Expanded(
                child: DataField(
                  label: 'Start Date',
                  type: TextInputType.number,
                  height: 70,
                  controller: experienceModel.startDate,
                ),
              ),
              Expanded(
                child: DataField(
                  label: 'End Date',
                  type: TextInputType.number,
                  height: 70,
                  controller: experienceModel.endDate,
                ),
              ),
            ],
          ),
          DataField(
            label: 'Detail',
            type: TextInputType.text,
            height: 70,
            controller: experienceModel.detail,
          ),
        ],
      ),
    );
  }
}
