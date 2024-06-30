import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resume_builder/controller/controller.dart';
import 'package:resume_builder/model/section_model/reference_model.dart';

import '../../widgets/text_field.dart';

class ReferenceScreen extends StatelessWidget {
  ReferenceScreen({super.key});

  final homeCtrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reference'),
      ),
      body: Obx(
        () => (homeCtrl.referenceItems.value.isEmpty)
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
                itemCount: homeCtrl.referenceItems.value.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      itemContainer(
                          index, homeCtrl.referenceItems.value[index]),
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
                homeCtrl.referenceItems.value.add(ReferenceModel(referee: TextEditingController(), jobTitle: TextEditingController(), company: TextEditingController(), email: TextEditingController(), phone: TextEditingController()));
                homeCtrl.referenceItems.refresh();
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

  Widget itemContainer(int index, ReferenceModel referenceModel) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Reference ${index + 1}',
                style: const TextStyle(fontSize: 18),
              ),
              IconButton(onPressed: () {
                homeCtrl.removeReferenceItem(index);
              }, icon: const Icon(Icons.delete))
            ],
          ),
          DataField(
            label: 'Referee Name',
            type: TextInputType.text,
            height: 70,
            controller: referenceModel.referee,
          ),
          DataField(
            label: 'Job Title',
            type: TextInputType.text,
            height: 70,
            controller: referenceModel.jobTitle,
          ),
          DataField(
            label: 'Company Name',
            type: TextInputType.text,
            height: 70,
            controller: referenceModel.company,
          ),
          DataField(
            label: 'Email',
            type: TextInputType.emailAddress,
            height: 70,
            controller: referenceModel.email,
          ),
          DataField(
            label: 'Phone',
            type: TextInputType.number,
            height: 70,
            controller: referenceModel.phone,
          ),
        ],
      ),
    );
  }
}
