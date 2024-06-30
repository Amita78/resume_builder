import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resume_builder/model/more_section_model/add_info_model.dart';

import '../../controller/controller.dart';
import '../../widgets/text_field.dart';

class AddInfoScreen extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();

  AddInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Info'),
      ),
      body: Obx(
        () => ListView.builder(
            itemCount: homeCtrl.addInfoItems.value.length,
            itemBuilder: (context, index) {
              return buildContainer(homeCtrl.addInfoItems.value[index]);
            }),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child:
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Save'),
        ),
      ),
    );
  }

  Container buildContainer(AddInfoModel addInfoModel) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Add Info',
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 18),
          ),
          DataField(
            controller: addInfoModel.addInfo,
            label: '',
            type: TextInputType.multiline,
            height: 150,
            maxLines: 6,
          ),
        ],
      ),
    );
  }
}
