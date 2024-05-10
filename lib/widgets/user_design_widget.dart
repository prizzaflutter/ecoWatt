import 'package:ecowatt_yassine_askour_flutter/model/Admin_model.dart';
import 'package:flutter/material.dart';
class AdminDesignWidget extends StatefulWidget {
  final AdminModel? adminModel;
  final BuildContext context ;
  const AdminDesignWidget({super.key, this.adminModel, required this.context});

  @override
  State<AdminDesignWidget> createState() => _AdminDesignWidgetState();
}

class _AdminDesignWidgetState extends State<AdminDesignWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
         if( widget.adminModel!.adminStatus == "on"){

         }
      },
    );
  }
}
