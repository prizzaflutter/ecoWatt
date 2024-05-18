import 'package:ecowatt_yassine_askour_flutter/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../global/global.dart';
import '../../../model/messages_model.dart';
import '../../../widgets/report_screens_widgets/chat_input_widget.dart';
import '../../../widgets/report_screens_widgets/message_card_widget.dart';
class chatScreen extends StatefulWidget {
  final BuildContext context;
  final UserModel userModel;
  final TextEditingController controller;

  const chatScreen(
      {super.key,
        required this.userModel,
      required this.context,
      required this.controller});

  @override
  State<chatScreen> createState() => _chatScreenState();
}

class _chatScreenState extends State<chatScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.lightBlueAccent.shade100,
          appBar:  AppBar(
            title: Text("Chat", style: GoogleFonts.acme(
              textStyle : TextStyle(
                fontWeight: FontWeight.bold,
                    color: Colors.green
              )
            )),
            // backgroundColor: Colors.blue.shade50,
        leadingWidth: 100,
        // leading: Row(
        //   children: [
        //     IconButton(
        //         onPressed: () => Navigator.of(context).pop(),
        //         icon: const Icon(Icons.arrow_back)),
        //     InkWell(
        //       onTap: () => Navigator.of(context).push(MaterialPageRoute(
        //           builder: (context) => FriendProfileScreen(
        //             userModel: widget.userModel,
        //           ))),
        //       child: Hero(
        //         tag: "askour",
        //         child: cachedNetworkImage(
        //             image: widget.userModel.userImage!,
        //             width: 50,
        //             height: 50),
        //       ),
        //     ),
        //   ],
        // ),
        // // actions: [
        // //   GestureDetector(
        // //       onTap: () {},
        // //       child: Image.asset(
        // //         "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/icon/phone.png",
        // //         width: 30,
        // //         height: 20,
        // //       )),
        // //   GestureDetector(
        // //       onTap: () {
        // //         bottomSheetWidget(context: context, userModel: widget.userModel,controller: messageController);
        // //       },
        // //       child: Image.asset(
        // //         "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/icon/chat.png",
        // //         width: 30,
        // //         height: 20,
        // //       )),
        // //   GestureDetector(
        // //       onTap: () {},
        // //       child: Image.asset(
        // //         "C:/Users/idris/OneDrive/Desktop/ecowatt_yassine_askour_flutter_admine/lib/assets/icon/dots.png",
        // //         width: 30,
        // //         height: 20,
        // //       )),
        // // ],
        // title: GestureDetector(
        //   onTap: () => Navigator.of(context).push(PageTransition(
        //       child: FriendProfileScreen(userModel: widget.userModel),
        //       type: PageTransitionType.fade)),
        //   child: Hero(
        //     tag: "profileName",
        //     child: Text(
        //       widget.userModel.userName.toString(),
        //       style: GoogleFonts.abel(
        //           textStyle: const TextStyle(
        //             fontWeight: FontWeight.bold,
        //           )),
        //     ),
        //   ),
        // ),
        automaticallyImplyLeading: true,
        centerTitle: true,
      ),
          body: Container(
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent.shade100,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 15.0,
                ),
                Expanded(
                  child: Container(
                    height: ScreenSize.height! * 0.5,
                    child: StreamBuilder(
                      stream: getAllMessages(widget.userModel.userUID.toString()),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          // if data is loading
                          case ConnectionState.waiting:
                          case ConnectionState.none:
                            return const Center(
                                child: CircularProgressIndicator());

                          // if some or all data is loaded the show it

                          case ConnectionState.active:
                          case ConnectionState.done:
                            return snapshot.data!.docs.length != 0
                                ? ListView.builder(
                              reverse:  false ,
                                    scrollDirection: Axis.vertical,
                                    itemCount: snapshot.data!.docs.length,
                                    itemBuilder: (context, index) {
                                      Message message = Message.fromJson(
                                          snapshot.data!.docs[index].data());
                                      return MessageCard(
                                          message: message,
                                          userModel: widget.userModel);
                                    })
                                : Center(child: Text("No User Found"));
                        }
                      },
                    ),
                  ),
                ),
                chatInputWidget(context: context, controller: widget.controller , userModel : widget.userModel),
              ],
            ),
          )),
    );
  }
}
