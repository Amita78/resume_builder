import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resume_builder/model/more_section_model/awards_model.dart';

import '../../controller/controller.dart';
import '../../widgets/text_field.dart';

class AwardsScreen extends StatelessWidget {
  AwardsScreen({super.key});

  final homeCtrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Awards'),
      ),
      body: Obx(
          ()=>(homeCtrl.awardsItems.value.isEmpty)
              ? const Center(
            child: Image(image: AssetImage('assets/images/data.png',),),
          )
              : ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 60),
          itemCount: homeCtrl.awardsItems.value.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                itemContainer(index,homeCtrl.awardsItems.value[index]),
                const Divider(),
                const SizedBox(height: 5),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar:  Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: (){
                homeCtrl.awardsItems.value.add(AwardsModel(description: TextEditingController()));
                homeCtrl.awardsItems.refresh();
              },
              child: const Text('Add'),
            ),
            ElevatedButton(
              onPressed: (){
                Get.back();
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemContainer(int index,AwardsModel awardsModel) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Achievement & Awards ${index + 1}',
                style: const TextStyle(fontSize: 18),),
              IconButton(onPressed: () {
                homeCtrl.removeAwardItem(index);
              }, icon: const Icon(Icons.delete))
            ],
          ),
          DataField(
            controller: awardsModel.description,
            label: 'Description', type: TextInputType.text,height: 70,),
        ],
      ),
    );
  }
}