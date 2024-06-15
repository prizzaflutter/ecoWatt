
import 'package:ecowatt_yassine_askour_flutter/global/global.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../../../model/report_model.dart';
pw.Widget buildTasksSection({required ReportModel reportModel, required pw.Font font, required pw.Font arabicFont}) {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Text("Tasks", style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold)),
      pw.SizedBox(height: 10),
      pw.Text(reportModel.tasks?.join(', ') ?? '', style: pw.TextStyle(fontSize: 10, font: font)),
      pw.SizedBox(height: 20),
    ],
  );
}

pw.Widget buildObservationsSection({required ReportModel reportModel, required pw.Font font, required pw.Font arabicFont}) {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Text("Observations", style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold)),
      pw.SizedBox(height: 10),
      pw.Text(reportModel.observations ?? '', style: pw.TextStyle(fontSize: 10, font: font)),
      pw.SizedBox(height: 20),
    ],
  );
}

pw.Widget buildBarcode({required ReportModel reportModel}) {
  return  pw.Row(
    children: [
  pw.BarcodeWidget(
  data: '${reportModel.reportID}',  // The data to encode in the barcode
    barcode: pw.Barcode.qrCode(),  // You can change this to other barcode types if needed
    width: 100,  // Width of the barcode
    height: 100,  // Height of the barcode
  ),
     
    ]
  );
}

String formatDate(DateTime date, List<String> format) {
  return "${date.year}-${date.month}-${date.day}";
}

pw.Widget buildBottom() {
  return pw.Center(
    child:  pw.Column(
        mainAxisAlignment: pw.MainAxisAlignment.center,
        children: [
          pw.SizedBox(
              height: 60
          ),

          pw.Text("Address :  Rue d’Inzgane route de l’hôpital, El Harch, Ait Melloul"),
          pw.Text("Lundi - vendredi:08:30 - 17:30"
              "\n Samedi :09:00 - 13:00"),

        ]
    )
  );
}


