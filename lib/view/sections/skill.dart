import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resume_builder/model/section_model/skill_model.dart';
import '../../controller/controller.dart';
import '../../widgets/text_field.dart';

class SkillScreen extends StatelessWidget {
  SkillScreen({super.key});

  final homeCtrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skill'),
      ),
      body: Obx(
        () => (homeCtrl.skillItems.value.isEmpty)
            ? const Center(
                child: Image(
                  image: AssetImage(
                    'assets/images/data.png',
                  ),
                ),
              )
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(bottom: 60),
                itemCount: homeCtrl.skillItems.value.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      itemContainer(index, homeCtrl.skillItems.value[index]),
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
                homeCtrl.skillItems.value.add(SkillModel(
                  skill: TextEditingController(),
                ));
                homeCtrl.skillItems.refresh();
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

  Widget itemContainer(int index, SkillModel skillModel) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Skill ${index + 1}',
                style: const TextStyle(fontSize: 18),
              ),
              IconButton(
                  onPressed: () {
                    homeCtrl.removeSkillItem(index);
                  },
                  icon: const Icon(Icons.delete))
            ],
          ),
          DataField(
            label: 'Skill',
            type: TextInputType.text,
            height: 70,
            controller: skillModel.skill,
          ),
        ],
      ),
    );
  }
}
