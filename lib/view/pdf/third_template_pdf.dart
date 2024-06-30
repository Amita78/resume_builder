import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../controller/controller.dart';

final homeCtrl = Get.find<HomeController>();

class ThirdPdfPreview extends StatelessWidget {
  const ThirdPdfPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return PdfPreview(
      build: (ctx) => firstPdf(),
    );
  }
}

Future<Uint8List> firstPdf() async {
  var imageProvider = FileImage(File(homeCtrl.profile.value));
  final image = await flutterImageProvider(imageProvider);
  final doc = pw.Document();
  doc.addPage(
    pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return <pw.Widget>[
            pw.Text(
              "Name",),
          ];
        }),
  );
  final pdfToByte = await doc.save();
  return pdfToByte;
}
