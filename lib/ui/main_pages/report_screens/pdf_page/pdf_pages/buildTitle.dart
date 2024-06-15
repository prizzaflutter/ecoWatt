import 'package:ecowatt_yassine_askour_flutter/model/report_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:pdf/widgets.dart' as pw ;
import '../../../../../model/Admin_model.dart';
import '../../../../../model/user_model.dart';
//
// Widget buildTitle(
//     {required context,
//     required UserModel userModel,
//     required ReportModel reportModel}) {
//   return Column(children: [
//     Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(children: [
//             Text("M.${userModel.userName}",
//                 style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
//             Text("Phone Number: ${userModel.userPhoneNumber}",
//                 style:
//                 TextStyle(fontSize: 10, fontWeight: FontWeight.normal)),
//             Text("Email: ${userModel.userEmail}",
//                 style:
//                 TextStyle(fontSize: 10, fontWeight: FontWeight.normal)),
//           ]),
//           BarcodeWidget(
//             data: '${reportModel.reportID}',  // The data to encode in the barcode
//             barcode: Barcode.qrCode(),  // You can change this to other barcode types if needed
//             width: 60,  // Width of the barcode
//             height: 60,
//           ),
//         ]
//     ),
//     Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(children: [
//           ]),
//           BarcodeWidget(
//             data: '${reportModel.reportID}',  // The data to encode in the barcode
//             barcode: Barcode.qrCode(),  // You can change this to other barcode types if needed
//             width: 60,  // Width of the barcode
//             height: 60,
//           ),
//         ]
//     ),
//      SizedBox(
//       height: ScreenSize.height! * .2,
//     )
//   ]);
// }

import 'package:flutter/services.dart' show rootBundle;
import 'dart:typed_data';

// Inside an async function
class ImageUtils {
  static Uint8List? imageData;

  static Future<void> loadImageBytes() async {
    ByteData data = await rootBundle.load('C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/images/TAQAUNIVERSLOGO.png');
    imageData = data.buffer.asUint8List();
  }
}
 pw.Widget buildTitle({required context, required UserModel userModel, required AdminModel adminModel, required ReportModel reportModel}){
   ImageUtils.loadImageBytes();
   var data = ImageUtils.imageData!;
  return pw.Column(children: [
    pw.Container(
      height: 60,
      width: 160,
      child: pw.Image(pw.MemoryImage(data))
    ),
    pw.SizedBox(
      height: 50
    ),
    pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
      pw.Column(children: [
        pw.Text("M.${userModel.userName}",
            style: pw.TextStyle(fontSize: 15, fontWeight: pw.FontWeight.bold)),
        pw.Text("Phone Number: ${userModel.userPhoneNumber}",
            style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.normal)),
        pw.Text("Email: ${userModel.userEmail}",
            style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.normal)),
      ]),
      pw.Column(children: [
        pw.Text("Admin: ${adminModel.adminName}",
            style: pw.TextStyle(fontSize: 15, fontWeight: pw.FontWeight.bold)),
        pw.Text("Phone Number: ${adminModel.adminPhoneNumber}",
            style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.normal)),
        pw.Text("Email: ${adminModel.adminEmail}",
            style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.normal)),
      ]),
    ]),
    pw.SizedBox(
      height: 30,
    )
  ]);
}