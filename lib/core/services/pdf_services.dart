import 'package:pdf/widgets.dart';
import 'package:flutter/services.dart';

class PdfServices {
  static late Font font;
  static init() async {
    font = Font.ttf(
      await rootBundle.load("assets/fonts/Cairo/Cairo-Regular.ttf"),
    );
  }

  static generatePdf({required Page page}) async {
    // final file = File('/storage/emulated/0/Download/report.pdf');
    Document pdf = Document();
    pdf.addPage(page);
    return pdf.save();

    // await Printing.layoutPdf(
    //   onLayout: (PdfPageFormat format) async => pdf.save(),
    // );
    // final pdfBytes = await pdf.save();
    // await file.writeAsBytes(pdfBytes);
    // await OpenFile.open(file.path);
  }

  // Add your PDF service methods here
}
