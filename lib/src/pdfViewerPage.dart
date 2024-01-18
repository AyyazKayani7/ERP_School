// import 'dart:io';

// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:dio/dio.dart';
// import 'package:file_picker/file_picker.dart';

// import 'package:flutter/material.dart';

// class PdfViewerPage extends StatefulWidget {
//   File file;
//   String url;
//   PdfViewerPage({super.key, required this.file, required this.url});

//   State<PdfViewerPage> createState() => _PdfViewerPageState();
// }

// class _PdfViewerPageState extends State<PdfViewerPage> {
//   @override
//   Widget build(BuildContext context) {
//     final name = basename(widget.file.path);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(name),
//         actions: [
//           IconButton(
//             onPressed: () async {
//               await saveFile(widget.url, "sample.pdf");
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(
//                   content: Text(
//                     'success',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               );
//             },
//             icon: const Icon(Icons.download_rounded),
//           ),
//         ],
//       ),
//       body: PDFView(
//         filePath: widget.file.path,
//       ),
//     );
//   }
// }
