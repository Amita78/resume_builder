import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resume_builder/view/home_screen.dart';

List image = [
  "assets/images/first_resume_template.jpg",
  "assets/images/second_resume_template.png",
 // "assets/images/third_resume_template.jpg",
 // "assets/images/forth_resume._template.jpg",
  'assets/images/fifth_resume_template.jpg',
  //"assets/images/sixth_resume_template.jpg",
];

class TemplateScreen extends StatelessWidget {
  const TemplateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Template'),
        actions: [
          TextButton(onPressed: (){
            Get.to(()=>HomeScreen(templateIndex: (image.length+1)));
          }, child: const Text('Skip'))
        ],
      ),
      body: GridView.builder(
          padding: EdgeInsets.all(10),
          itemCount: image.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                print(index.toString());
                Get.to(() => HomeScreen(templateIndex: index));
              },
              child: SizedBox(
                height: 130,
                width: 60,
                child: Image(
                  image: AssetImage(image[index]),
                  fit: BoxFit.fitHeight,
                ),
              ),
            );
          }),
    );
  }
}
