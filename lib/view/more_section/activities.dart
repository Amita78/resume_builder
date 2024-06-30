import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resume_builder/model/more_section_model/activities_model.dart';
import 'package:resume_builder/widgets/text_field.dart';

import '../../controller/controller.dart';

class ActivitiesScreen extends StatelessWidget {
  ActivitiesScreen({super.key});

  final homeCtrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activities'),
      ),
      body: Obx(
        () =>(homeCtrl.activitiesItems.value.isEmpty)
            ? const Center(
          child: Image(image: AssetImage('assets/images/data.png',),),
        )
            : ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 60),
          itemCount: homeCtrl.activitiesItems.value.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                itemContainer(index,homeCtrl.activitiesItems.value[index]),
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
                homeCtrl.activitiesItems.value.add(ActivitiesModel(description: TextEditingController()));
                homeCtrl.activitiesItems.refresh();
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

  Widget itemContainer(int index, ActivitiesModel activitiesModel) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Activity ${index + 1}',
                style: const TextStyle(fontSize: 18),
              ),
              IconButton(onPressed: () {
                homeCtrl.removeActivityItem(index);
              }, icon: const Icon(Icons.delete))
            ],
          ),
          DataField(
            controller: activitiesModel.description,
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
