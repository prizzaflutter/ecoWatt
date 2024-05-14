import 'package:ecowatt_yassine_askour_flutter/global/global.dart';
import 'package:ecowatt_yassine_askour_flutter/model/user_model.dart';
import 'package:ecowatt_yassine_askour_flutter/ui/main_pages/report_screen.dart';
import 'package:flutter/material.dart';

Widget chatInputWidget({required BuildContext context , required TextEditingController controller}) {
  return Padding(
    padding:  EdgeInsets.symmetric(vertical: ScreenSize.height! * .01, horizontal: ScreenSize.width! * .025),
    child: Row(
      children: [
        Expanded(
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.emoji_emotions,
                      color: Colors.blueAccent,
                      size: 25,
                    )),
                Expanded(
                  child: TextField(
                    controller:controller ,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                        hintText: "Type Something...",
                        hintStyle: TextStyle(
                          color: Colors.blueAccent,
                        ),
                        border: InputBorder.none),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.image,
                      color: Colors.blueAccent,
                      size: 24,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.camera_alt_rounded,
                      color: Colors.blueAccent,
                      size: 26,
                    )),
              ],
            ),
          ),
        ),
        MaterialButton(
          shape: const CircleBorder(),
          padding: EdgeInsets.only(top: 10, bottom: 10,right: 5, left: 10 ),
          color: Colors.green,
          minWidth: 0,
          onPressed: () async{
            if (controller.text.isNotEmpty){
             await  sendMessage(uid, controller.text, GlobalUserUID).then((value) {
               controller.clear();
             });
            }
          },
          child: Icon(
            Icons.send,
            color: Colors.white,
            size: 28,
          ),
        )
      ],
    ),
  );
}
