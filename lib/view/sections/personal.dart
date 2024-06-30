import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resume_builder/controller/controller.dart';
import 'package:resume_builder/model/section_model/personal_model.dart';
import 'package:resume_builder/widgets/text_field.dart';

class PersonalScreen extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();

  PersonalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Details'),
      ),
      body: Obx(
        () => (homeCtrl.personalItems.value.isEmpty)
            ? const Center(
                child: Image(
                  image: AssetImage(
                    'assets/images/data.png',
                  ),
                ),
              )
            : ListView.builder(
                itemCount: homeCtrl.personalItems.value.length,
                itemBuilder: (context, index) {
                  return itemContainer(homeCtrl.personalItems.value[index]);
                }),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
          onPressed: () {
              Get.back();
            },
          child: const Text('Save'),
        ),
      ),
    );
  }

  Column itemContainer(PersonalModel personalModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 20,
        ),
        Obx(
          () => CircleAvatar(
            radius: 60,
            backgroundImage: homeCtrl.profile.value.isNotEmpty
                ? FileImage(File(homeCtrl.profile.value.toString()))
                : null,
            backgroundColor: Colors.deepPurple[100],
            child: homeCtrl.profile.value.isEmpty
                ? const Icon(
                    Icons.person,
                    size: 90,
                    color: Colors.white, // Adjust the icon color as needed
                  )
                : null,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                homeCtrl.pickImage();
              },
              child: const Text('Change'),
            ),
            ElevatedButton(
              onPressed: () {
                homeCtrl.removeImage();
              },
              child: const Text('Remove'),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        DataField(
          controller: personalModel.name,
          label: 'Name',
          type: TextInputType.name,
          height: 70,
        ),
        DataField(
          controller: personalModel.position,
          label: 'Position',
          type: TextInputType.name,
          height: 70,
        ),
        DataField(
          controller: personalModel.address,
          label: 'Address',
          type: TextInputType.multiline,
          height: 120,
          maxLines: 3,
        ),
        DataField(
          controller: personalModel.email,
          label: 'Email',
          type: TextInputType.emailAddress,
          height: 70,
        ),
        DataField(
          controller: personalModel.phone,
          label: 'Phone',
          type: TextInputType.number,
          height: 70,
        ),
      ],
    );
  }
}
