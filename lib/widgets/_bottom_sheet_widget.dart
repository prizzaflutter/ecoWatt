
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import '../global/global.dart';
import '../model/messages_model.dart';
import '../model/user_model.dart';
import 'chat_input_widget.dart';
import 'message_card_widget.dart';

Future  bottomSheetWidget({required BuildContext context, required UserModel userModel, required TextEditingController controller}){

  return  showStickyFlexibleBottomSheet(
      minHeight: 0,
      initHeight: 0.9,
      maxHeight: 1,
      headerHeight: 40,
      context: context,
      isExpand: true,
      headerBuilder: (BuildContext context, double offset) {
        return Container(color: Colors.blue,);
      },
      bodyBuilder: (BuildContext context, double offset) {
        return SliverChildListDelegate(
            [
              Container(
                height: ScreenSize.height! * 0.5,
                child: StreamBuilder(
                  stream: getAllMessages(uid),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                    // if data is loading
                      case ConnectionState.waiting:
                      case ConnectionState.none:
                        return const Center(child: CircularProgressIndicator());

                    // if some or all data is loaded the show it

                      case ConnectionState.active:
                      case ConnectionState.done:
                        return snapshot.data!.docs.length != 0
                            ? ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              Message message = Message.fromJson(snapshot.data!.docs[index].data());
                              return MessageCard(message : message, userModel : userModel);
                            })
                            : Center(child: Text("No User Found"));
                    }
                  },
                ),
              ),
              chatInputWidget(context: context,controller: controller),
            ]
        );
      });
}