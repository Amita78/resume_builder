import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resume_builder/model/more_section_model/interest_model.dart';

import '../../controller/controller.dart';
import '../../widgets/text_field.dart';

class InterestScreen extends StatelessWidget {
  InterestScreen({super.key});

  final homeCtrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interests'),
      ),
      body: Obx(
        () =>(homeCtrl.interestItems.value.isEmpty)
            ? const Center(
          child: Image(image: AssetImage('assets/images/data.png',),),
        )
            : ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 60),
          itemCount: homeCtrl.interestItems.value.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                itemContainer(index,homeCtrl.interestItems.value[index]),
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
                homeCtrl.interestItems.value.add(
                  InterestsModel(description: TextEditingController()));
                homeCtrl.interestItems.refresh();
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

  Widget itemContainer(int index,InterestsModel interestsModel) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Interest ${index + 1}',
                style: const TextStyle(fontSize: 18),
              ),
              IconButton(onPressed: () {
                homeCtrl.removeInterestItem(index);
              }, icon: const Icon(Icons.delete))
            ],
          ),
          DataField(
            controller: interestsModel.description,
            label: 'Description',
            type: TextInputType.text,
            height: 70,
          ),
        ],
      ),
    );
  }
}
