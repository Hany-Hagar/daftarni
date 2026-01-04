// ignore_for_file: non_constant_identifier_names

import 'package:pdf/pdf.dart';
import 'download_type_card.dart';
import 'package:pdf/widgets.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../core/services/service_locator.dart';
import '../../../../data/models/analysis_category_model.dart';

Page DownloadReportBody({
  required Font font,
  required String title,
  required double incomeTotal,
  required double expenseTotal,
  required List<AnalysisCategoryModel> incomeTransactions,
  required List<AnalysisCategoryModel> expenseTransactions,
}) {
  var s = S.current;
  var isArabic = ServiceLocator.getDataModel().preferences.langI == 1;
  return MultiPage(
    margin: EdgeInsets.all(20),
    pageFormat: PdfPageFormat.a4,
    theme: ThemeData.withFont(base: font),
    textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
    build: (Context context) {
      return [
        _top(title: title, font: font),
        SizedBox(height: 15),
        AnalysisCard(
          font: font,
          isArabic: isArabic,
          title: s.income,
          total: incomeTotal.toStringAsFixed(2),
          pdfColor: PdfColors.green,
          transactions: incomeTransactions,
        ),
        SizedBox(height: 15),
        AnalysisCard(
          font: font,
          isArabic: isArabic,
          title: s.income,
          total: expenseTotal.toStringAsFixed(2),
          pdfColor: PdfColors.red,
          transactions: expenseTransactions,
        ),
      ];
    },
  );
}

Widget _top({required String title, required Font font}) {
  double size = title.length > 55 ? 18 : 22;
  return Container(
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: PdfColors.grey300,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Center(
      child: Text(
        title,
        style: TextStyle(
          font: font,
          fontSize: size,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
