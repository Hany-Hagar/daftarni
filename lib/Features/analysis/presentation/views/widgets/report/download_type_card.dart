// ignore_for_file: non_constant_identifier_names

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../core/services/service_locator.dart';
import '../../../../data/models/analysis_category_model.dart';

PdfColor darken(PdfColor color, double amount) {
  final r = (color.red * (1 - amount)).clamp(0.0, 1.0);
  final g = (color.green * (1 - amount)).clamp(0.0, 1.0);
  final b = (color.blue * (1 - amount)).clamp(0.0, 1.0);
  return PdfColor(r, g, b, color.alpha);
}

Widget AnalysisCard({
  required bool isArabic,
  required Font font,
  required String title,
  required String total,
  required PdfColor pdfColor,
  required List<AnalysisCategoryModel> transactions,
}) {
  return Directionality(
    textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
    child: ClipRRect(
      horizontalRadius: 8,
      verticalRadius: 8,
      child: _tables(
        font: font,
        title: title,
        isArabic: isArabic,
        totalValue: total,
        headerColor: pdfColor,
        transactions: transactions,
      ),
    ),
  );
}

Widget _title({
  required Font font,
  required String title,
  required String total,
  required PdfColor pdfColor,
}) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    decoration: BoxDecoration(color: pdfColor),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(font: font, color: PdfColors.white, fontSize: 24),
        ),
        Text(
          total,
          style: TextStyle(font: font, color: PdfColors.white, fontSize: 24),
        ),
      ],
    ),
  );
}

Widget _tables({
  required Font font,
  required String title,
  required String totalValue,
  required PdfColor headerColor,
  required bool isArabic,
  required List<AnalysisCategoryModel> transactions,
}) {
  var s = S.current;
  final List<TableRow> rows = [];
  var langI = ServiceLocator.getDataModel().preferences.langI;

  /// Header
  rows.add(
    TableRow(
      decoration: BoxDecoration(color: headerColor),
      children: _reArrangeCells(
        isArabic: isArabic,
        cells: [
          _text(isHeader: true, font: font, text: s.amount),
          _text(isHeader: true, font: font, text: s.category),
          _text(isHeader: true, font: font, text: s.notes),
          _text(isHeader: true, font: font, text: s.date),
        ],
      ),
    ),
  );

  for (final category in transactions) {
    for (final tx in category.transactions) {
      rows.add(
        TableRow(
          decoration: BoxDecoration(color: PdfColors.white),
          children: _reArrangeCells(
            isArabic: isArabic,
            cells: [
              _text(font: font, text: tx.value.toStringAsFixed(2)),
              _text(font: font, text: tx.category.title[langI]),
              _text(font: font, text: tx.notes.isEmpty ? "-" : tx.notes),
              _text(font: font, text: _formatDate(tx.time)),
            ],
          ),
        ),
      );
    }

    /// Category Total Row
    rows.add(
      TableRow(
        decoration: BoxDecoration(color: headerColor),
        children: _reArrangeCells(
          cells: [
            _text(
              isHeader: true,
              font: font,
              text: category.totalValue.toStringAsFixed(2),
            ),
            _text(isHeader: true, font: font, text: ""),
            _text(isHeader: true, font: font, text: ""),
            _text(isHeader: true, font: font, text: s.total),
          ],
          isArabic: isArabic,
        ),
      ),
    );
  }

  return Column(
    children: [
      _title(
        font: font,
        title: title,
        total: totalValue,
        pdfColor: headerColor,
      ),
      Table(
        columnWidths: {
          0: isArabic ? FlexColumnWidth(1.2) : FlexColumnWidth(1.8),
          1: isArabic ? FlexColumnWidth(1.5) : FlexColumnWidth(2.5),
          2: isArabic ? FlexColumnWidth(2.5) : FlexColumnWidth(1.5),
          3: isArabic ? FlexColumnWidth(1.8) : FlexColumnWidth(1.2),
        },
        border: TableBorder.all(color: PdfColors.grey400, width: 0.5),
        children: rows,
      ),
    ],
  );
}

String _formatDate(DateTime date) {
  return "${date.day}/${date.month}/${date.year}";
}

Widget _text({
  bool isHeader = false,
  required Font font,
  required String text,
  PdfColor? color,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
    child: Text(
      text,
      style: TextStyle(
        font: font,
        fontSize: isHeader ? 20 : 16,
        fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
        color: color ?? (isHeader ? PdfColors.white : PdfColors.black),
      ),
    ),
  );
}

List<Widget> _reArrangeCells({
  required List<Widget> cells,
  required bool isArabic,
}) {
  return isArabic ? cells : cells.reversed.toList();
}
