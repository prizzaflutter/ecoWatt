import 'package:ecowatt_yassine_askour_flutter/model/user_model.dart';
import 'package:ecowatt_yassine_askour_flutter/ui/main_pages/admin_report_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import 'cached_network_image.dart';

class AdminReportDesignWidget extends StatefulWidget {
  final UserModel userModel;
  final BuildContext? context;

  const AdminReportDesignWidget({
    super.key,
    this.context,
    required this.userModel,
  });

  @override
  State<AdminReportDesignWidget> createState() => _AdminReportDesignWidgetState();
}

class _AdminReportDesignWidgetState extends State<AdminReportDesignWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
         Navigator.of(context).push(PageTransition(child: AdminReportScreen(userModel: widget.userModel), type: PageTransitionType.rightToLeft));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.black12,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight:Radius.circular(30) ,topLeft: Radius.circular(30))
          ),
          child: Row(
            children: [
              cachedNetworkImage(image: widget.userModel.userImage!, width: 65, height: 65),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.userModel.userName.toString(), style: GoogleFonts.acme()),
                          Text(widget.userModel.userEmail.toString(), style : GoogleFonts.acme()),
                        ],
                      ),
                    ),
                     Column(
                       children: [
                         CircleAvatar(
                           maxRadius: 6,
                           backgroundColor: widget.userModel.userStatus == "on" ? Colors.green : Colors.grey,
                         ),
                         const SizedBox(
                           height: 5.0,
                         ),
                         const CircleAvatar(
                           maxRadius: 10,
                           child: Text("1"),
                         ),
                       ],
                     )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
