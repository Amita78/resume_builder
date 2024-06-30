import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resume_builder/model/more_section_model/language_model.dart';

import '../../controller/controller.dart';
import '../../widgets/text_field.dart';

class LanguageScreen extends StatelessWidget {
  LanguageScreen({super.key});

  final homeCtrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Languages'),
      ),
      body: Obx(
        () =>(homeCtrl.languageItems.value.isEmpty)
            ? const Center(
          child: Image(image: AssetImage('assets/images/data.png',),),
        )
            : ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 60),
          itemCount: homeCtrl.languageItems.value.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                itemContainer(index,homeCtrl.languageItems.value[index]),
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
                homeCtrl.languageItems.value.add(LanguageModel(description: TextEditingController()));
                homeCtrl.languageItems.refresh();
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

  Widget itemContainer(int index,LanguageModel languageModel) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Language ${index + 1}',
                style: const TextStyle(fontSize: 18),
              ),
              IconButton(onPressed: () {
                homeCtrl.removeLanguageItem(index);
              }, icon: const Icon(Icons.delete))
            ],
          ),
          DataField(
            controller: languageModel.description,
            label: 'Description',
            type: TextInputType.text,
            height: 70,
          ),
        ],
      ),
    );
  }
}
