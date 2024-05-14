import 'package:ecowatt_yassine_askour_flutter/global/global.dart';
import 'package:flutter/material.dart';

import '../model/messages_model.dart';
import '../model/user_model.dart';
class MessageCard extends StatefulWidget {
  final Message message;
  final UserModel userModel;
  const MessageCard({super.key, required this.message, required this.userModel});

  @override
  State<MessageCard> createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {
  late final String adminUID ;
  @override
  void initState() {
     adminUID = sharedPreferences.getString("uid").toString();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return adminUID == widget.message.fromId ?
    _greenMessage() : _blueMessage();
  }

  // sender or another user message
Widget _blueMessage(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Flexible(
        child: Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 221, 245, 255),
                border: Border.all(color: Colors.lightBlue),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                )
            ),
            padding: EdgeInsets.all(ScreenSize.height! * .01),
            margin: EdgeInsets.symmetric(
                horizontal: ScreenSize.width! * .04, vertical: ScreenSize.height! * .01
            ),
            child : Text(widget.message.msg)
        ),
      ),
      Padding(
        padding: EdgeInsets.only(right: ScreenSize.width! * .04),
        child : Text(
          widget.message.sent,
          style : const TextStyle(fontSize: 13, color: Colors.black12)
        )
      )
    ],);
}
Widget _greenMessage(){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Row(children: [
        Icon(Icons.done_all_rounded,color: Colors.blueAccent,),
        SizedBox(width: 5.0,),
        Padding(
            padding: EdgeInsets.only(right: ScreenSize.width! * .04),
            child : Text(
                widget.message.sent,
                style : const TextStyle(fontSize: 13, color: Colors.black12)
            )
        ),
      ],),
      Flexible(
        child: Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 218, 255, 176),
                border: Border.all(color: Colors.lightBlue),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                )
            ),
            padding: EdgeInsets.all(ScreenSize.height! * .01),
            margin: EdgeInsets.symmetric(
                horizontal: ScreenSize.width! * .04, vertical: ScreenSize.height! * .01
            ),
            child : Text(widget.message.msg)
        ),
      )
    ],),
  );
}
}
