import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resume_builder/model/more_section_model/activities_model.dart';
import 'package:resume_builder/model/more_section_model/add_info_model.dart';
import 'package:resume_builder/model/more_section_model/awards_model.dart';
import 'package:resume_builder/model/more_section_model/interest_model.dart';
import 'package:resume_builder/model/more_section_model/language_model.dart';
import 'package:resume_builder/model/more_section_model/projects_model.dart';
import 'package:resume_builder/model/more_section_model/publications_model.dart';
import 'package:resume_builder/model/section_model/education_model.dart';
import 'package:resume_builder/model/section_model/experience_model.dart';
import 'package:resume_builder/model/section_model/objective_model.dart';
import 'package:resume_builder/model/section_model/personal_model.dart';
import 'package:resume_builder/model/section_model/reference_model.dart';
import 'package:resume_builder/model/section_model/skill_model.dart';
import 'package:resume_builder/view/sections/personal.dart';

class HomeController extends GetxController {
  Rx<List<EducationModel>> educationItems = Rx<List<EducationModel>>([]);
  Rx<List<ExperienceModel>> experienceItems = Rx<List<ExperienceModel>>([]);
  Rx<List<SkillModel>> skillItems = Rx<List<SkillModel>>([]);
  Rx<List<ObjectiveModel>> objectiveItems = Rx<List<ObjectiveModel>>([]);
  Rx<List<ReferenceModel>> referenceItems = Rx<List<ReferenceModel>>([]);
  Rx<List<ActivitiesModel>> activitiesItems = Rx<List<ActivitiesModel>>([]);
  Rx<List<AddInfoModel>> addInfoItems = Rx<List<AddInfoModel>>([]);
  Rx<List<AwardsModel>> awardsItems = Rx<List<AwardsModel>>([]);
  Rx<List<InterestsModel>> interestItems = Rx<List<InterestsModel>>([]);
  Rx<List<LanguageModel>> languageItems = Rx<List<LanguageModel>>([]);
  Rx<List<ProjectModel>> projectItems = Rx<List<ProjectModel>>([]);
  Rx<List<PublicationsModel>> publicationItems =
      Rx<List<PublicationsModel>>([]);
  Rx<List<PersonalModel>> personalItems = Rx<List<PersonalModel>>([]);
  final profile = ''.obs;
  final personalCount = 1.obs;
  final objectiveCount = 1.obs;
  final addInfoCount = 1.obs;

  @override
  void onInit() {
    addAddInfoItem();
    addObjectiveItem();
    addPersonalItem();
    super.onInit();
  }

  addPersonalItem() {
    if (personalCount.value == 1) {
      personalItems.value.add(PersonalModel(
          name: TextEditingController(),
          position: TextEditingController(),
          address: TextEditingController(),
          email: TextEditingController(),
          phone: TextEditingController()));
      personalItems.refresh();
      personalCount.value++;
    }
  }

  addAddInfoItem() {
    if (addInfoCount.value == 1) {
      addInfoItems.value.add(
        AddInfoModel(
          addInfo: TextEditingController(),
        ),
      );
      addInfoItems.refresh();
      addInfoCount.value++;
    }
  }

  addObjectiveItem() {
    if (objectiveCount.value == 1) {
      objectiveItems.value.add(ObjectiveModel(
        objective: TextEditingController(),
      ));
      objectiveItems.refresh();
      objectiveCount.value++;
    }
  }

  removeEducationItem(int index) {
    educationItems.value.removeAt(index);
    educationItems.refresh();
  }

  removeExperienceItem(int index) {
    experienceItems.value.removeAt(index);
    experienceItems.refresh();
  }

  removeSkillItem(int index) {
    skillItems.value.removeAt(index);
    skillItems.refresh();
  }

  removeReferenceItem(int index) {
    referenceItems.value.removeAt(index);
    referenceItems.refresh();
  }

  removeProjectItem(int index) {
    projectItems.value.removeAt(index);
    projectItems.refresh();
  }

  removeActivityItem(int index) {
    activitiesItems.value.removeAt(index);
    activitiesItems.refresh();
  }

  removeInterestItem(int index) {
    interestItems.value.removeAt(index);
    interestItems.refresh();
  }

  removeLanguageItem(int index) {
    languageItems.value.removeAt(index);
    languageItems.refresh();
  }

  removeAwardItem(int index) {
    awardsItems.value.removeAt(index);
    awardsItems.refresh();
  }

  removePublicationItem(int index) {
    publicationItems.value.removeAt(index);
    publicationItems.refresh();
  }

  Future pickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final image = await picker.pickImage(source: ImageSource.gallery);
      profile.value = image!.path
          .toString(); //note the image is coming from x file so need to convert to string
    } on PlatformException catch (e) {
      print("Error $e");
    }
  }

  removeImage() {
    profile.value = '';
  }
}
