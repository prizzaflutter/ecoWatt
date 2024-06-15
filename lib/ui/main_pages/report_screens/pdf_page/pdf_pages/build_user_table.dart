import 'package:ecowatt_yassine_askour_flutter/global/global.dart';
import 'package:ecowatt_yassine_askour_flutter/model/report_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:pdf/pdf.dart';
import '../../../../../model/user_model.dart';
import'package:pdf/widgets.dart' as pw ;

// Widget buildUserTable ({  required context , required UserModel userModel , required ReportModel reportModel , required Font font, required Font arabicFont }) {
//   bool _isArabic (String text) {
//     final arabicCharRegExp =  RegExp(r'[\u0600-\u06FF]');
//         return arabicCharRegExp.hasMatch(text);
//   }
//
//   final headers = [
//     "Date",
//     "Taches",
//     "chantier",
//     "Les frais du Chantier",
//     "KWc",
//     "Observatins",
//   ];
//   final data = [
//     headers,
//     [
//       format_Date(reportModel.publishedDate.toDate()),
//     reportModel.tasks.toString(),
//     reportModel.people,
//     reportModel.constructionCosts,
//     reportModel.kwc,
//     reportModel.observations
//     ]];
//   // Load the custom font
//        return Table(
//          border: TableBorder.all(width: 1),
//          children: [
//            for (int rowIndex = 0 ; rowIndex < data.length ; rowIndex++)
//              TableRow(
//                decoration:  BoxDecoration(
//                  color : rowIndex == 0 ? PdfColors.grey300 : PdfColors.white,
//                ),
//                children: [
//                  for (int colIndex = 0; colIndex < data[rowIndex].length; colIndex++)
//                    Container(
//                      padding: const EdgeInsets.all(5), // Change the background color of the first row
//                      child: Directionality(
//                        textDirection: _isArabic(data[rowIndex][colIndex].toString())?  TextDirection.rtl: TextDirection.ltr,
//                        child: Text(
//                          data[rowIndex][colIndex].toString(),
//                          style: TextStyle(
//                            fontSize: 10,
//                            font: _isArabic(data[rowIndex][colIndex].toString())?  arabicFont: font,
//                            fontWeight: rowIndex == 0 ? FontWeight.bold : FontWeight.normal, // Make the first row bold
//                            color: rowIndex == 0 ? PdfColors.blue : PdfColors.black, // Change the text color of the first row
//                          ),
//                        ),
//                      )
//                    ),
//                ],
//              ),
//
//          ],
//            columnWidths: {
//            0 : FlexColumnWidth(1),
//              1: FlexColumnWidth(2),
//              2 : FlexColumnWidth(2),
//              3: FlexColumnWidth(2),
//              4: FlexColumnWidth(1),
//              5: FlexColumnWidth(3),
//
//        },
//        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
//        );
// }
pw.Widget buildUserTable({required context, required UserModel userModel, required ReportModel reportModel, required pw.Font font, required pw.Font arabicFont}) {
  bool _isArabic(String text) {
    final arabicCharRegExp = RegExp(r'[\u0600-\u06FF]');
    return arabicCharRegExp.hasMatch(text);
  }

  final headers = [
    "Date",
    "Taches",
    "Chantier",
    "Les frais du Chantier",
    "KWc",
  ];
  final data = [
    headers,
    [
      formatDate(reportModel.publishedDate.toDate(), ["YYYY-MM-DD"]),
      reportModel.tasks.toString(),
      reportModel.people,
      reportModel.constructionCosts.toString(),
      reportModel.kwc.toString(),

    ]
  ];

  return pw.Table(
    border: pw.TableBorder.all(width: 1),
    children: [
      for (int rowIndex = 0; rowIndex < data.length; rowIndex++)
        pw.TableRow(
          decoration: pw.BoxDecoration(
            color: rowIndex == 0 ? PdfColors.grey300 : PdfColors.white,
          ),
          children: [
            for (int colIndex = 0; colIndex < data[rowIndex].length; colIndex++)
              pw.Container(
                padding: const pw.EdgeInsets.all(5),
                constraints: const pw.BoxConstraints(minWidth: 50, minHeight: 20),  // Set the minimum width and height for each cell
                child: pw.Directionality(
                  textDirection: _isArabic(data[rowIndex][colIndex].toString()) ? pw.TextDirection.rtl : pw.TextDirection.ltr,
                  child: pw.Text(
                    data[rowIndex][colIndex].toString(),
                    style: pw.TextStyle(
                      fontSize: 10,
                      font: _isArabic(data[rowIndex][colIndex].toString()) ? arabicFont : font,
                      fontWeight: rowIndex == 0 ? pw.FontWeight.bold : pw.FontWeight.normal,
                      color: rowIndex == 0 ? PdfColors.blue : PdfColors.black,
                    ),
                  ),
                ),
              ),
          ],
        ),
    ],

    columnWidths: {
      0: const pw.FlexColumnWidth(1),  // Date
      1: const pw.FlexColumnWidth(3),  // Taches
      2: const pw.FlexColumnWidth(2),  // Chantier
      3: const pw.FlexColumnWidth(1),  // Les frais du Chantier
      4: const pw.FlexColumnWidth(1),  // Observations
    },
    defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
  );
}

String formatDate(DateTime date, List<String> format) {
  return "${date.year}-${date.month}-${date.day}";
}
