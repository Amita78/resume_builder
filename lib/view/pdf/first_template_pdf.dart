import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../controller/controller.dart';

final homeCtrl = Get.find<HomeController>();

class FirstPdfPreview extends StatelessWidget {
  const FirstPdfPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return PdfPreview(
      build: (ctx) => firstPdf(),
    );
  }
}

pw.TextStyle style(double? fontSize, pw.FontWeight? weight, PdfColor? color) {
  return pw.TextStyle(
    fontSize: fontSize,
    fontWeight: weight,
    color: color,
  );
}

Future<Uint8List> firstPdf() async {
  var imageProvider = FileImage(File(homeCtrl.profile.value));
  final image = await flutterImageProvider(imageProvider);
  final doc = pw.Document();
  doc.addPage(
    pw.MultiPage(
        //maxPages: 100,
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return <pw.Widget>[
            pw.Column(children: [
              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.ListView.builder(
                      itemCount: homeCtrl.personalItems.value.length,
                      itemBuilder: (context, index) {
                        return pw.Container(
                          decoration: pw.BoxDecoration(
                              borderRadius: pw.BorderRadius.circular(10)),
                          child: pw.Image(
                            image,
                            height: 100,
                            width: 80,
                            fit: pw.BoxFit.cover,
                          ),
                        );
                      },
                    ),
                    pw.SizedBox(width: 70),
                    pw.ListView.builder(
                        itemCount: homeCtrl.personalItems.value.length,
                        itemBuilder: (context, index) {
                          return pw.SizedBox(
                              height: 90,
                              width: 400,
                              child: pw.Text(
                                  homeCtrl.personalItems.value[index].name.text,
                                  style: style(48, pw.FontWeight.bold,
                                      PdfColors.black)));

                          // pw.Divider(
                          //   thickness: 1,
                          // )
                        })
                  ]),
              pw.SizedBox(height: 20),
              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.SizedBox(
                      width: 150,
                      child: pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.start,
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.ListView.builder(
                                itemCount: homeCtrl.personalItems.value.length,
                                itemBuilder: (context, index) {
                                  return pw.Column(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.start,
                                      children: [
                                        pw.Text(
                                            homeCtrl.personalItems.value[index]
                                                .position.text,
                                            style: style(20, pw.FontWeight.bold,
                                                PdfColors.black)),
                                        pw.Text(
                                            homeCtrl.personalItems.value[index]
                                                .email.text,
                                            style: style(
                                                13,
                                                pw.FontWeight.normal,
                                                PdfColors.black)),
                                        pw.Text(
                                            homeCtrl.personalItems.value[index]
                                                .phone.text,
                                            style: style(
                                                13,
                                                pw.FontWeight.normal,
                                                PdfColors.black)),
                                        pw.SizedBox(height: 10),
                                        pw.Text(
                                            homeCtrl.personalItems.value[index]
                                                .address.text,
                                            style: style(
                                                13,
                                                pw.FontWeight.normal,
                                                PdfColors.black)),
                                      ]);
                                })
                          ]),
                    ),
                    pw.Container(
                        height: 110,
                        width: 350,
                        padding: const pw.EdgeInsets.all(10),
                        decoration: pw.BoxDecoration(
                          borderRadius: pw.BorderRadius.circular(10),
                          color: PdfColors.grey,
                        ),
                        child: pw.Column(
                            mainAxisAlignment: pw.MainAxisAlignment.start,
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              if (homeCtrl.objectiveItems.value.isNotEmpty)
                                pw.Text('Profile',
                                    style: style(20, pw.FontWeight.bold,
                                        PdfColors.black)),
                              pw.ListView.builder(
                                itemCount: homeCtrl.objectiveItems.value.length,
                                itemBuilder: (context, index) {
                                  return pw.Column(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.start,
                                      children: [
                                        pw.Align(
                                            alignment: pw.Alignment.topLeft,
                                            child: pw.Text(
                                                homeCtrl
                                                    .objectiveItems
                                                    .value[index]
                                                    .objective
                                                    .text,
                                                style: style(
                                                    13,
                                                    pw.FontWeight.normal,
                                                    PdfColors.black))),
                                        pw.SizedBox(height: 10),
                                      ]);
                                },
                              ),
                            ])),
                  ]),
              pw.SizedBox(height: 10),
              pw.Divider(),
              pw.SizedBox(height: 10),
              pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    pw.SizedBox(
                      width: 300,
                      child: pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.start,
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            if (homeCtrl.experienceItems.value.isNotEmpty)
                              pw.Text('Experience',
                                  style: style(
                                      25, pw.FontWeight.bold, PdfColors.black)),
                            if (homeCtrl.experienceItems.value.isNotEmpty)
                              pw.SizedBox(height: 10),
                            pw.ListView.builder(
                              itemCount: homeCtrl.experienceItems.value.length,
                              itemBuilder: (context, index) {
                                return pw.Column(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                          padding: const pw.EdgeInsets.all(3),
                                          child: pw.Text(
                                              homeCtrl.experienceItems
                                                  .value[index].company.text,
                                              style: style(
                                                  18,
                                                  pw.FontWeight.normal,
                                                  PdfColors.white)),
                                          color: PdfColors.black),
                                      pw.Text(
                                          "${homeCtrl.experienceItems.value[index].jobTitle.text} (${homeCtrl.experienceItems.value[index].startDate.text} - ${homeCtrl.experienceItems.value[index].endDate.text})",
                                          style: style(18, pw.FontWeight.normal,
                                              PdfColors.black)),
                                      pw.Text(
                                          homeCtrl.experienceItems.value[index]
                                              .detail.text,
                                          style: style(18, pw.FontWeight.normal,
                                              PdfColors.black)),
                                      pw.SizedBox(height: 10),
                                    ]);
                              },
                            ),
                            if (homeCtrl.experienceItems.value.isNotEmpty)
                              pw.SizedBox(height: 10),
                            if (homeCtrl.educationItems.value.isNotEmpty)
                              pw.Text('Education',
                                  style: style(
                                      25, pw.FontWeight.bold, PdfColors.black)),
                            if (homeCtrl.educationItems.value.isNotEmpty)
                              pw.SizedBox(height: 10),
                            pw.ListView.builder(
                              itemCount: homeCtrl.educationItems.value.length,
                              itemBuilder: (context, index) {
                                return pw.Column(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Container(
                                          padding: pw.EdgeInsets.all(3),
                                          child: pw.Text(
                                              homeCtrl.educationItems
                                                  .value[index].college.text,
                                              style: style(
                                                  18,
                                                  pw.FontWeight.normal,
                                                  PdfColors.white)),
                                          color: PdfColors.black),
                                      pw.Text(
                                          "${homeCtrl.educationItems.value[index].course.text} (${homeCtrl.educationItems.value[index].year.text})",
                                          style: style(18, pw.FontWeight.normal,
                                              PdfColors.black)),
                                      pw.Text(
                                          homeCtrl.educationItems.value[index]
                                              .grade.text,
                                          style: style(18, pw.FontWeight.normal,
                                              PdfColors.black)),
                                      pw.SizedBox(height: 10),
                                    ]);
                              },
                            ),
                            if (homeCtrl.educationItems.value.isNotEmpty)
                              pw.SizedBox(height: 10),
                          ]),
                    ),
                    pw.SizedBox(
                      width: 200,
                      child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          mainAxisAlignment: pw.MainAxisAlignment.start,
                          children: [
                            if (homeCtrl.skillItems.value.isNotEmpty)
                              pw.Container(
                                padding: pw.EdgeInsets.all(10),
                                width: 200,
                                decoration: pw.BoxDecoration(
                                  borderRadius: pw.BorderRadius.circular(10),
                                  color: PdfColors.grey,
                                ),
                                child: pw.Column(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text('Skills',
                                          style: style(25, pw.FontWeight.bold,
                                              PdfColors.black)),
                                      pw.SizedBox(height: 10),
                                      pw.ListView.builder(
                                        itemCount:
                                            homeCtrl.skillItems.value.length,
                                        itemBuilder: (context, index) {
                                          return pw.Column(
                                              mainAxisAlignment:
                                                  pw.MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  pw.CrossAxisAlignment.start,
                                              children: [
                                                pw.Align(
                                                    alignment:
                                                        pw.Alignment.topLeft,
                                                    child: pw.Text(
                                                        "${index + 1}.  ${homeCtrl.skillItems.value[index].skill.text}",
                                                        style: style(
                                                            18,
                                                            pw.FontWeight
                                                                .normal,
                                                            PdfColors.black))),
                                                pw.SizedBox(height: 10),
                                              ]);
                                        },
                                      ),
                                    ]),
                              ),
                            if (homeCtrl.skillItems.value.isNotEmpty)
                              pw.SizedBox(height: 10),
                            if (homeCtrl.referenceItems.value.isNotEmpty)
                              pw.Container(
                                padding: pw.EdgeInsets.all(10),
                                width: 200,
                                decoration: pw.BoxDecoration(
                                  borderRadius: pw.BorderRadius.circular(10),
                                  color: PdfColors.grey,
                                ),
                                child: pw.Column(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text('References',
                                          style: style(25, pw.FontWeight.bold,
                                              PdfColors.black)),
                                      pw.SizedBox(height: 10),
                                      pw.ListView.builder(
                                        itemCount: homeCtrl
                                            .referenceItems.value.length,
                                        itemBuilder: (context, index) {
                                          return pw.Column(
                                              mainAxisAlignment:
                                                  pw.MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  pw.CrossAxisAlignment.start,
                                              children: [
                                                pw.Row(
                                                    crossAxisAlignment: pw
                                                        .CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      pw.Text(
                                                          "${(index + 1).toString()}.",
                                                          style: style(
                                                              18,
                                                              pw.FontWeight
                                                                  .normal,
                                                              PdfColors.black)),
                                                      pw.SizedBox(width: 9),
                                                      pw.Column(
                                                          crossAxisAlignment: pw
                                                              .CrossAxisAlignment
                                                              .start,
                                                          children: [
                                                            pw.Text(
                                                                homeCtrl
                                                                    .referenceItems
                                                                    .value[
                                                                        index]
                                                                    .referee
                                                                    .text,
                                                                style: style(
                                                                    18,
                                                                    pw.FontWeight
                                                                        .normal,
                                                                    PdfColors
                                                                        .black)),
                                                            pw.Text(
                                                                homeCtrl
                                                                    .referenceItems
                                                                    .value[
                                                                        index]
                                                                    .company
                                                                    .text,
                                                                style: style(
                                                                    18,
                                                                    pw.FontWeight
                                                                        .normal,
                                                                    PdfColors
                                                                        .black)),
                                                            pw.Text(
                                                                homeCtrl
                                                                    .referenceItems
                                                                    .value[
                                                                        index]
                                                                    .jobTitle
                                                                    .text,
                                                                style: style(
                                                                    18,
                                                                    pw.FontWeight
                                                                        .normal,
                                                                    PdfColors
                                                                        .black)),
                                                            pw.Text(
                                                                homeCtrl
                                                                    .referenceItems
                                                                    .value[
                                                                        index]
                                                                    .email
                                                                    .text,
                                                                style: style(
                                                                    18,
                                                                    pw.FontWeight
                                                                        .normal,
                                                                    PdfColors
                                                                        .black)),
                                                            pw.Text(
                                                                homeCtrl
                                                                    .referenceItems
                                                                    .value[
                                                                        index]
                                                                    .phone
                                                                    .text,
                                                                style: style(
                                                                    18,
                                                                    pw.FontWeight
                                                                        .normal,
                                                                    PdfColors
                                                                        .black)),
                                                          ])
                                                    ]),
                                                pw.SizedBox(height: 10),
                                              ]);
                                        },
                                      ),
                                    ]),
                              ),
                            if (homeCtrl.referenceItems.value.isNotEmpty)
                              pw.SizedBox(height: 10),
                          ]),
                    )
                  ]),
              pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    pw.SizedBox(
                      width: 300,
                      child: pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          if (homeCtrl.projectItems.value.isNotEmpty)
                            pw.Text('Projects',
                                style: style(
                                    25, pw.FontWeight.bold, PdfColors.black)),
                          if (homeCtrl.projectItems.value.isNotEmpty)
                            pw.SizedBox(height: 10),
                          pw.ListView.builder(
                            itemCount: homeCtrl.projectItems.value.length,
                            itemBuilder: (context, index) {
                              return pw.Column(
                                  mainAxisAlignment: pw.MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.Container(
                                        padding: pw.EdgeInsets.all(3),
                                        child: pw.Text(
                                            homeCtrl.projectItems.value[index]
                                                .title.text,
                                            style: style(
                                                18,
                                                pw.FontWeight.normal,
                                                PdfColors.white)),
                                        color: PdfColors.black),
                                    pw.Text(
                                        homeCtrl.projectItems.value[index]
                                            .description.text,
                                        style: style(18, pw.FontWeight.normal,
                                            PdfColors.black)),
                                    pw.SizedBox(height: 10),
                                  ]);
                            },
                          ),
                          if (homeCtrl.projectItems.value.isNotEmpty)
                            pw.SizedBox(height: 10),
                          if (homeCtrl.publicationItems.value.isNotEmpty)
                            pw.Text('Publication',
                                style: style(
                                    25, pw.FontWeight.bold, PdfColors.black)),
                          if (homeCtrl.publicationItems.value.isNotEmpty)
                            pw.Divider(),
                          pw.ListView.builder(
                            itemCount: homeCtrl.publicationItems.value.length,
                            itemBuilder: (context, index) {
                              return pw.Column(
                                  mainAxisAlignment: pw.MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.Container(
                                        padding: pw.EdgeInsets.all(3),
                                        child: pw.Text(
                                            homeCtrl.publicationItems
                                                .value[index].title.text,
                                            style: style(
                                                18,
                                                pw.FontWeight.normal,
                                                PdfColors.white)),
                                        color: PdfColors.black),
                                    pw.Text(
                                        homeCtrl.publicationItems.value[index]
                                            .description.text,
                                        style: style(18, pw.FontWeight.normal,
                                            PdfColors.black)),
                                    pw.SizedBox(height: 10),
                                  ]);
                            },
                          ),
                          if (homeCtrl.publicationItems.value.isNotEmpty)
                            pw.SizedBox(height: 10),
                        ],
                      ),
                    ),
                    pw.SizedBox(
                        width: 200,
                        child: pw.Column(
                            mainAxisAlignment: pw.MainAxisAlignment.start,
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              if (homeCtrl.activitiesItems.value.isNotEmpty)
                                pw.Container(
                                  padding: pw.EdgeInsets.all(10),
                                  width: 200,
                                  decoration: pw.BoxDecoration(
                                    borderRadius: pw.BorderRadius.circular(10),
                                    color: PdfColors.grey,
                                  ),
                                  child: pw.Column(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.start,
                                      children: [
                                        pw.Text('Activities',
                                            style: style(25, pw.FontWeight.bold,
                                                PdfColors.black)),
                                        pw.SizedBox(height: 10),
                                        pw.ListView.builder(
                                          itemCount: homeCtrl
                                              .activitiesItems.value.length,
                                          itemBuilder: (context, index) {
                                            return pw.Column(
                                                mainAxisAlignment:
                                                    pw.MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    pw.CrossAxisAlignment.start,
                                                children: [
                                                  pw.Row(
                                                      crossAxisAlignment: pw
                                                          .CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        pw.Text(
                                                            "${(index + 1).toString()}.",
                                                            style: style(
                                                                18,
                                                                pw.FontWeight
                                                                    .normal,
                                                                PdfColors
                                                                    .black)),
                                                        pw.SizedBox(width: 9),
                                                        pw.Column(
                                                            mainAxisAlignment: pw
                                                                .MainAxisAlignment
                                                                .start,
                                                            crossAxisAlignment: pw
                                                                .CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              pw.Text(
                                                                  homeCtrl
                                                                      .activitiesItems
                                                                      .value[
                                                                          index]
                                                                      .description
                                                                      .text,
                                                                  style: style(
                                                                      18,
                                                                      pw.FontWeight
                                                                          .normal,
                                                                      PdfColors
                                                                          .black)),
                                                            ])
                                                      ]),
                                                  pw.SizedBox(height: 10),
                                                ]);
                                          },
                                        ),
                                      ]),
                                ),
                              if (homeCtrl.activitiesItems.value.isNotEmpty)
                                pw.SizedBox(height: 10),
                              if (homeCtrl.interestItems.value.isNotEmpty)
                                pw.Container(
                                  padding: pw.EdgeInsets.all(10),
                                  width: 200,
                                  decoration: pw.BoxDecoration(
                                    borderRadius: pw.BorderRadius.circular(10),
                                    color: PdfColors.grey,
                                  ),
                                  child: pw.Column(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.start,
                                      children: [
                                        pw.Text('Interests',
                                            style: style(25, pw.FontWeight.bold,
                                                PdfColors.black)),
                                        pw.SizedBox(height: 10),
                                        pw.ListView.builder(
                                          itemCount: homeCtrl
                                              .interestItems.value.length,
                                          itemBuilder: (context, index) {
                                            return pw.Column(
                                                mainAxisAlignment:
                                                    pw.MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    pw.CrossAxisAlignment.start,
                                                children: [
                                                  pw.Row(
                                                      mainAxisAlignment: pw
                                                          .MainAxisAlignment
                                                          .start,
                                                      crossAxisAlignment: pw
                                                          .CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        pw.Text(
                                                            "${(index + 1).toString()}.",
                                                            style: style(
                                                                18,
                                                                pw.FontWeight
                                                                    .normal,
                                                                PdfColors
                                                                    .black)),
                                                        pw.SizedBox(width: 9),
                                                        pw.Column(
                                                            crossAxisAlignment: pw
                                                                .CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              pw.Text(
                                                                  homeCtrl
                                                                      .interestItems
                                                                      .value[
                                                                          index]
                                                                      .description
                                                                      .text,
                                                                  style: style(
                                                                      18,
                                                                      pw.FontWeight
                                                                          .normal,
                                                                      PdfColors
                                                                          .black)),
                                                            ])
                                                      ]),
                                                  pw.SizedBox(height: 10),
                                                ]);
                                          },
                                        ),
                                      ]),
                                ),
                              if (homeCtrl.interestItems.value.isNotEmpty)
                                pw.SizedBox(height: 10),
                              if (homeCtrl.languageItems.value.isNotEmpty)
                                pw.Container(
                                  padding: pw.EdgeInsets.all(10),
                                  width: 200,
                                  decoration: pw.BoxDecoration(
                                    borderRadius: pw.BorderRadius.circular(10),
                                    color: PdfColors.grey,
                                  ),
                                  child: pw.Column(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.start,
                                      children: [
                                        pw.Text('Languages',
                                            style: style(25, pw.FontWeight.bold,
                                                PdfColors.black)),
                                        pw.SizedBox(height: 10),
                                        pw.ListView.builder(
                                          itemCount: homeCtrl
                                              .languageItems.value.length,
                                          itemBuilder: (context, index) {
                                            return pw.Column(
                                                mainAxisAlignment:
                                                    pw.MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    pw.CrossAxisAlignment.start,
                                                children: [
                                                  pw.Row(
                                                      mainAxisAlignment: pw
                                                          .MainAxisAlignment
                                                          .start,
                                                      crossAxisAlignment: pw
                                                          .CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        pw.Text(
                                                            "${(index + 1).toString()}.",
                                                            style: style(
                                                                18,
                                                                pw.FontWeight
                                                                    .normal,
                                                                PdfColors
                                                                    .black)),
                                                        pw.SizedBox(width: 9),
                                                        pw.Column(
                                                            mainAxisAlignment: pw
                                                                .MainAxisAlignment
                                                                .start,
                                                            crossAxisAlignment: pw
                                                                .CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              pw.Text(
                                                                  homeCtrl
                                                                      .languageItems
                                                                      .value[
                                                                          index]
                                                                      .description
                                                                      .text,
                                                                  style: style(
                                                                      18,
                                                                      pw.FontWeight
                                                                          .normal,
                                                                      PdfColors
                                                                          .black)),
                                                            ])
                                                      ]),
                                                  pw.SizedBox(height: 10),
                                                ]);
                                          },
                                        ),
                                      ]),
                                ),
                              if (homeCtrl.languageItems.value.isNotEmpty)
                                pw.SizedBox(height: 10),
                              if (homeCtrl.awardsItems.value.isNotEmpty)
                                pw.Container(
                                  padding: pw.EdgeInsets.all(10),
                                  width: 200,
                                  decoration: pw.BoxDecoration(
                                    borderRadius: pw.BorderRadius.circular(10),
                                    color: PdfColors.grey,
                                  ),
                                  child: pw.Column(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.start,
                                      children: [
                                        pw.Text('Awards & Achievements',
                                            style: style(25, pw.FontWeight.bold,
                                                PdfColors.black)),
                                        pw.SizedBox(height: 10),
                                        pw.ListView.builder(
                                          itemCount:
                                              homeCtrl.awardsItems.value.length,
                                          itemBuilder: (context, index) {
                                            return pw.Column(
                                                mainAxisAlignment:
                                                    pw.MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    pw.CrossAxisAlignment.start,
                                                children: [
                                                  pw.Row(
                                                      crossAxisAlignment: pw
                                                          .CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        pw.Text(
                                                            "${(index + 1).toString()}.",
                                                            style: style(
                                                                18,
                                                                pw.FontWeight
                                                                    .normal,
                                                                PdfColors
                                                                    .black)),
                                                        pw.SizedBox(width: 9),
                                                        pw.Column(
                                                            crossAxisAlignment: pw
                                                                .CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              pw.Text(
                                                                  homeCtrl
                                                                      .awardsItems
                                                                      .value[
                                                                          index]
                                                                      .description
                                                                      .text,
                                                                  style: style(
                                                                      18,
                                                                      pw.FontWeight
                                                                          .normal,
                                                                      PdfColors
                                                                          .black)),
                                                            ])
                                                      ]),
                                                  pw.SizedBox(height: 10),
                                                ]);
                                          },
                                        ),
                                      ]),
                                ),
                              if (homeCtrl.awardsItems.value.isNotEmpty)
                                pw.SizedBox(height: 10),
                            ]))
                  ])
            ])
          ];
        }),
  );
  final pdfToByte = await doc.save();
  return pdfToByte;
}
