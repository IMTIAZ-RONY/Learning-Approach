import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
class TermCondition extends StatelessWidget {
  const TermCondition ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(title:Text("PDF Viewer") ,) ,
      body:SfPdfViewer.network(
        'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
        canShowScrollHead: true,
        canShowScrollStatus:true ,
        scrollDirection: PdfScrollDirection.vertical,
        pageLayoutMode: PdfPageLayoutMode.single,

      ) ,
    );
  }
}
