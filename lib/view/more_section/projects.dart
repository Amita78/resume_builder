import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resume_builder/model/more_section_model/projects_model.dart';
import 'package:resume_builder/widgets/text_field.dart';

import '../../controller/controller.dart';

class ProjectScreen extends StatelessWidget {
  ProjectScreen({super.key});

  final homeCtrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects'),
      ),
      body: Obx(
        () => (homeCtrl.projectItems.value.isEmpty)
            ? const Center(
          child: Image(image: AssetImage('assets/images/data.png',),),
        )
            : ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 60),
          itemCount: homeCtrl.projectItems.value.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                itemContainer(index,homeCtrl.projectItems.value[index]),
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
                homeCtrl.projectItems.value.add(ProjectModel(
                  title: TextEditingController(),
                  description: TextEditingController(),
                ));
                homeCtrl.projectItems.refresh();
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

  Widget itemContainer(int index, ProjectModel projectModel) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Project ${index + 1}',
                style: const TextStyle(fontSize: 18),
              ),
              IconButton(onPressed: () {
                homeCtrl.removeProjectItem(index);
              }, icon: const Icon(Icons.delete))
            ],
          ),
          DataField(
            controller: projectModel.title,
            label: 'Title',
            type: TextInputType.text,
            height: 70,
          ),
          DataField(
            controller: projectModel.description,
            label: 'Description',
            type: TextInputType.text,
            height: 120,
            maxLines: 4,
          ),
        ],
      ),
    );
  }
}
