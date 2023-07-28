import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:insurance_boost/src/features/core/models/pdf_model.dart';

class PdfController {
  Future<String> uploadPdf(String fileName, File file) async {
    final refrence = FirebaseStorage.instance.ref().child("pdfs/$fileName.pdf");
    final uploadTask = refrence.putFile(file);
    await uploadTask.whenComplete(() {});
    final downloadLink = await refrence.getDownloadURL();
    return downloadLink;
  }

  Future<void> addPdfToFirestore(String fileName, String downloadLink) async {
    await FirebaseFirestore.instance.collection("pdfs").add({
      "name": fileName,
      "url": downloadLink,
    });
  }

  Future<List<PdfModel>> getAllPdf() async {
    final results = await FirebaseFirestore.instance.collection("pdfs").get();
    return results.docs.map((e) => PdfModel.fromMap(e.data() ?? {})).toList();
  }
}
