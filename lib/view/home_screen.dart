import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resume_builder/controller/controller.dart';
import 'package:resume_builder/view/more_section/activities.dart';
import 'package:resume_builder/view/more_section/add_info.dart';
import 'package:resume_builder/view/more_section/awards.dart';
import 'package:resume_builder/view/more_section/interest.dart';
import 'package:resume_builder/view/more_section/languages.dart';
import 'package:resume_builder/view/more_section/projects.dart';
import 'package:resume_builder/view/more_section/publications.dart';
import 'package:resume_builder/view/pdf/first_template_pdf.dart';
import 'package:resume_builder/view/pdf/pdf_preview.dart';
import 'package:resume_builder/view/pdf/second_template_pdf.dart';
import 'package:resume_builder/view/pdf/third_template_pdf.dart';
import 'package:resume_builder/view/sections/education.dart';
import 'package:resume_builder/view/sections/experience.dart';
import 'package:resume_builder/view/sections/objective.dart';
import 'package:resume_builder/view/sections/personal.dart';
import 'package:resume_builder/view/sections/reference.dart';
import 'package:resume_builder/view/sections/skill.dart';
import 'package:resume_builder/view/pdf/fifth_template_pdf.dart';

class HomeScreen extends StatelessWidget {
  final homeCtrl = Get.put(HomeController());
  final int templateIndex;
  HomeScreen({required this.templateIndex,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const Text('Resume Builder'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            //section
            buildSection(),

            //more section
            buildMoreSection(),

            //button
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () {
                  if (homeCtrl.profile.value.isNotEmpty) {
                    switch(templateIndex){
                      case 0:
                       Get.to(()=>const FirstPdfPreview());
                      case 1:
                        Get.to(()=>const SecondPdfPreview());
                      // case 2:
                      //   Get.to(()=>const ThirdPdfPreview());
                      // case 3:
                      //   Get.to(()=>const PdfPreviewPage());
                      case 2:
                        Get.to(()=>const FifthPdfPreview());
                      default:
                        Get.to(()=>const PdfPreviewPage());
                    }
                    //Get.to(() => const PdfPreviewPage());
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Please select an Image')));
                  }
                },
                style: ElevatedButton.styleFrom(minimumSize: Size(300, 40)),
                child: const Text('Pdf Preview'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildMoreSection() {
    return Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.deepPurple[100]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "More Sections",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildSection('Projects', () {
                      Get.to(() =>  ProjectScreen());
                    }),
                    _buildSection(
                        'Activities', () {
                      Get.to(() =>  ActivitiesScreen());
                    }),
                    _buildSection('Add Info', () {
                      homeCtrl.addInfoItems.value = [];
                      Get.to(() => AddInfoScreen());
                    })
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildSection('Interest', () {
                      Get.to(() =>  InterestScreen());
                    }),
                    _buildSection('Languages', () {
                      Get.to(() =>  LanguageScreen());
                    }),
                    _buildSection('Awards', () {
                      Get.to(() =>  AwardsScreen());
                    })
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildSection('Publications', () {
                      Get.to(() => PublicationScreen());
                    }),
                  ],
                ),
              ],
            ),
          );
  }

  Container buildSection() {
    return Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.deepPurple[100]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Sections",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildSection('Personal', () {
                      Get.to(() => PersonalScreen());
                    }),
                    _buildSection('Education', () {
                      Get.to(() =>  EducationScreen());
                    }),
                    _buildSection('Experience', () {
                      Get.to(() =>  ExperienceScreen());
                    })
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildSection('Skill', () {
                      Get.to(() =>  SkillScreen());
                    }),
                    _buildSection('Objective', () {
                      Get.to(() => ObjectiveScreen());
                    }),
                    _buildSection('References', () {
                      Get.to(() =>  ReferenceScreen());
                    })
                  ],
                )
              ],
            ),
          );
  }

  InkWell _buildSection(String text, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        )),
      ),
    );
  }
}
