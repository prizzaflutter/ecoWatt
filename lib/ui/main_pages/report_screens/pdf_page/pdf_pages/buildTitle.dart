import 'package:ecowatt_yassine_askour_flutter/model/report_model.dart';
import 'package:pdf/widgets.dart' ;

import '../../../../../model/user_model.dart';
Widget buildTitle ({required UserModel userModel, required ReportModel reportModel}){
  return Column(
    children: [
      Text(reportModel.tasks.toString()),
    ]
  );
}