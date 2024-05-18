import 'package:ecowatt_yassine_askour_flutter/model/user_model.dart';
import 'package:ecowatt_yassine_askour_flutter/ui/main_pages/report_screens/user_report_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../../global/global.dart';
import '../../model/messages_model.dart';
import '../custom_widgets/custom_cached_network_image.dart';

class userCardDesignWidget extends StatefulWidget {
  final UserModel userModel;
  final BuildContext? context;
  const userCardDesignWidget({
    super.key,
    this.context,
    required this.userModel,
  });
  @override
  State<userCardDesignWidget> createState() => _userCardDesignWidgetState();
}
class _userCardDesignWidgetState extends State<userCardDesignWidget> {
  Message? _message;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
        // todo save the GlobalUserUID to global variable && navigate to UserReportScreen
         Navigator.of(context).push(PageTransition(child: userReportScreen(userModel: widget.userModel), type: PageTransitionType.rightToLeft));
      },
      child: StreamBuilder(
        stream: getLastMessage(widget.userModel),
        builder: (context, snapshot) {
          final data = snapshot.data?.docs ;
          final list = data?.map((e) => Message.fromJson(e.data())).toList() ?? [];
          if (list.isNotEmpty) _message = list[0];

          return Card(
            margin: EdgeInsets.all(5.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child:  ListTile(
              leading: cachedNetworkImage(
                  image: widget.userModel.userImage.toString(),
                  width: 65,
                  height: 65),
              title:Text(widget.userModel.userName.toString(),
                  style: GoogleFonts.acme()),
              subtitle:Text(_message != null ? _message?.type == Type.image ? "image" :  _message!.msg.length > 30 ? "${_message!.msg.substring(0,30)}..." :_message!.msg.toString(): widget.userModel.userEmail.toString(),
                  style: GoogleFonts.acme()),
              trailing: _message == null ? null : _message!.read.isEmpty  && _message!.fromId != adminUID? Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  color: Colors.greenAccent.shade400,
                  borderRadius: BorderRadius.circular(10),
                ),
              ) : Text(getLastMessageTime(context: context, time: _message!.sent), style: TextStyle(color: Colors.black54),),
            ),
          );
        }
      ),
    );
  }
}
