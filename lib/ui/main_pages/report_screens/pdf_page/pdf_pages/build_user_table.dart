
import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';
import 'package:date_format/date_format.dart';
import 'package:ecowatt_yassine_askour_flutter/model/report_model.dart';
import '../../../../../model/user_model.dart';
import'package:pdf/widgets.dart';

Widget buildUserTable ({ required UserModel userModel , required ReportModel reportModel}){
  final headers = [
    "Date",
    "Taches",
    "chantier",
    "Les frais du Chantier",
    "KWc",
    "Observatins",
  ];
  final data = [
    headers,
    [
    formatDate(reportModel.publishedDate.toDate(), ["DD-MM-YYYY"]),
    reportModel.tasks.toString(),
    reportModel.people,
    reportModel.constructionCosts,
    reportModel.kwc,
    reportModel.observations
    ]];
       return Table(
         border: TableBorder.all(width: 1),
         children: [
           for (final row in data)
             TableRow(children: [
               for(final cell in row )
                 Container(
                   padding : EdgeInsets.all(5),
                   child : Text(cell.toString(), style: TextStyle(fontSize: 10),)
                 ),
             ]),
         ],
           columnWidths: {
           0 : FlexColumnWidth(1),
             1: FlexColumnWidth(2),
             2 : FlexColumnWidth(2),
             3: FlexColumnWidth(2),
             4: FlexColumnWidth(1),
             5: FlexColumnWidth(3),

       },
       defaultVerticalAlignment: TableCellVerticalAlignment.middle,
       );
}