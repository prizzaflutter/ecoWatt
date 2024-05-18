import 'dart:io';
import 'package:ecowatt_yassine_askour_flutter/global/global.dart';
import 'package:ecowatt_yassine_askour_flutter/model/Admin_model.dart';
import 'package:ecowatt_yassine_askour_flutter/model/messages_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../model/user_model.dart';

class chatInputWidget extends StatefulWidget {
  final BuildContext context ;
  final TextEditingController controller;
  final  UserModel userModel ;

  const chatInputWidget({super.key, required this.context, required this.controller,required this.userModel});

  @override
  State<chatInputWidget> createState() => _chatInputWidgetState();
}
bool showEmoji = false;
class _chatInputWidgetState extends State<chatInputWidget> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
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
                      onPressed: () {
                        setState(() {
                          showEmoji = !showEmoji;
                        });
                      },
                      icon: Icon(
                        Icons.emoji_emotions,
                        color: Colors.blueAccent,
                        size: 25,
                      )),
                  Expanded(
                    child: TextField(
                      controller: widget.controller ,
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
                      onPressed: () async {
                        final ImagePicker picker = ImagePicker();
                        // pick an image
                        final List<XFile> images = await picker.pickMultiImage(imageQuality: 70);

                        // uploading & sending image on by one
                        images.map((image) async{
                          setState(() {
                          });
                          await sendChatImage(widget.userModel, File(image.path)).then((value){
                            return value ;
                          });
                        });
                      },
                      icon: Icon(
                        Icons.image,
                        color: Colors.blueAccent,
                        size: 24,
                      )),
                  IconButton(
                      onPressed: () async {
                        final ImagePicker picker = ImagePicker();
                        // pick an image
                        final XFile? image = await picker.pickImage(source: ImageSource.camera, imageQuality: 80);
                        if(image != null){
                          await sendChatImage(widget.userModel, File(image.path));
                        }
                      },
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
              if (widget.controller.text.isNotEmpty){
                await  sendMessage(adminUID, widget.controller.text,widget.userModel.userUID.toString(), Type.text).then((value) {
                  widget.controller.clear();
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
}



