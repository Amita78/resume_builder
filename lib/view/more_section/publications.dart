import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resume_builder/model/more_section_model/publications_model.dart';
import 'package:resume_builder/widgets/text_field.dart';

import '../../controller/controller.dart';

class PublicationScreen extends StatelessWidget {
  PublicationScreen({super.key});

  final homeCtrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Publication'),
      ),
      body: Obx(
        () => (homeCtrl.publicationItems.value.isEmpty)
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
                itemCount: homeCtrl.publicationItems.value.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      itemContainer(
                          index, homeCtrl.publicationItems.value[index]),
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
                homeCtrl.publicationItems.value.add(PublicationsModel(title: TextEditingController(), description: TextEditingController()));
                homeCtrl.publicationItems.refresh();
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

  Widget itemContainer(int index, PublicationsModel publicationsModel) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Publication ${index + 1}',
                style: const TextStyle(fontSize: 18),
              ),
              IconButton(onPressed: () {
                homeCtrl.removePublicationItem(index);
              }, icon: const Icon(Icons.delete))
            ],
          ),
          DataField(
            controller: publicationsModel.title,
            label: 'Title',
            type: TextInputType.text,
            height: 70,
          ),
          DataField(
            controller: publicationsModel.description,
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
