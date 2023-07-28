import 'dart:io';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:insurance_boost/src/features/core/models/pdf_model.dart';
import 'package:insurance_boost/src/features/core/controllers/pdf_controller.dart';
import 'package:insurance_boost/src/features/core/screens/dashboard/widgets/bot_nav.dart';

class PdfScreen extends StatefulWidget {
  const PdfScreen({super.key});

  @override
  State<PdfScreen> createState() => _PdfScreen();
}

class _PdfScreen extends State<PdfScreen> {
  final PdfController _pdfController = PdfController();
  List<PdfModel> pdfData = [];

  void pickFile() async {
    final pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (pickedFile != null) {
      String fileName = pickedFile.files[0].name;
      File file = File(pickedFile.files[0].path!);
      final downloadLink = await _pdfController.uploadPdf(fileName, file);
      await _pdfController.addPdfToFirestore(fileName, downloadLink);
      print("pdf uploaded successfully");
      getAllPdf();
    }
  }

  Future<void> getAllPdf() async {
    pdfData = await _pdfController.getAllPdf();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getAllPdf();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Insurance Policy"),
      ),
      body: GridView.builder(
        itemCount: pdfData.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                final url = pdfData[index].url;
                if (url.isNotEmpty && Uri.tryParse(url) != null) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PdfViewerScreen(pdfUrl: url),
                    ),
                  );
                } else {
                  // Show an error message for invalid PDF URL
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Invalid PDF URL'),
                        content: const Text('The PDF URL is not valid.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      "assets/images/pdf.png",
                      height: 120,
                      width: 100,
                    ),
                    Text(
                      pdfData[index].name,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.upload_file),
        onPressed: pickFile,
        tooltip: 'Upload PDF', // Add a tooltip to the FloatingActionButton
      ),
            bottomNavigationBar:
          const BotNavBar(), // Move the bottomNavigationBar here
    );
  }
}

class PdfViewerScreen extends StatefulWidget {
  final String pdfUrl;
  const PdfViewerScreen({super.key, required this.pdfUrl});

  @override
  State<PdfViewerScreen> createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  PDFDocument? document;

  void initialisePdf() async {
    document = await PDFDocument.fromURL(widget.pdfUrl);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initialisePdf();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: document != null
          ? PDFViewer(document: document!)
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
